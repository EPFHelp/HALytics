#include <ArduinoWebsockets.h>
#include <WiFi.h>
#include "secrets.h"

/**
 * List of pins used by the pressure & force sensors
 */
#define FORCE_SENSOR_PIN 35 // ESP32 pin GIOP35 (ADC1): 

/**
 * Wifi constants -- from secrets.h (.env like)
 */
const char* ssid = WIFI_SSID;
const char* password = WIFI_PASSWORD; 

/**
 * @deprecated -- The server URL for HTTP requests. Not used for Websocket conections
 */
String serverName = "http://localhost:8080/update-sensor";

/**
 * The Websocket connection URL.
 * The server is hosted on localhost with an ngrok tunnel forwarding messages & connections.
 */
const char* websockets_connection_string = WEBSOCKET_URL;

/**
 * The following variables are unsigned longs because the time, measured in
 * milliseconds, will quickly become a bigger number than can be stored in an int.
 */
unsigned long lastTime = 0;

/**
 * Timer set to 10 minutes (600000)
 * unsigned long timerDelay = 600000;
 * Set timer to 5 seconds (5000)
 */
unsigned long timerDelay = 5000;

/**
 * s:CN=*.ngrok-free.app
 * i:C=US, O=Let's Encrypt, CN=E5
 * a:PKEY: id-ecPublicKey, 256 (bit); sigalg: ecdsa-with-SHA384
 * v:NotBefore: Feb  2 17:27:40 2025 GMT; NotAfter: May  3 17:27:39 2025 GMT
 */
const char ngrok_ca_cert[] PROGMEM = \
"-----BEGIN CERTIFICATE-----\n" \
"MIIDkTCCAxegAwIBAgISA6zPC6ya1h0O+ymwij3zERDvMAoGCCqGSM49BAMDMDIx\n" \
"CzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQDEwJF\n" \
"NTAeFw0yNTAyMDIxNzI3NDBaFw0yNTA1MDMxNzI3MzlaMBsxGTAXBgNVBAMMECou\n" \
"bmdyb2stZnJlZS5hcHAwWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAQJOnqig+aa\n" \
"JGny0C7oSG9RzTtjOM19BnNI0GBseoTQTK8xH9QuEbee0nGUMpVVAleT9YJVwo5F\n" \
"8vgBcDnKqpH/o4ICIjCCAh4wDgYDVR0PAQH/BAQDAgeAMB0GA1UdJQQWMBQGCCsG\n" \
"AQUFBwMBBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBRqLXNaTVsi\n" \
"A9T84DhJrN4vzbP6rjAfBgNVHSMEGDAWgBSfK1/PPCFPnQS37SssxMZwi9LXDTBV\n" \
"BggrBgEFBQcBAQRJMEcwIQYIKwYBBQUHMAGGFWh0dHA6Ly9lNS5vLmxlbmNyLm9y\n" \
"ZzAiBggrBgEFBQcwAoYWaHR0cDovL2U1LmkubGVuY3Iub3JnLzArBgNVHREEJDAi\n" \
"ghAqLm5ncm9rLWZyZWUuYXBwgg5uZ3Jvay1mcmVlLmFwcDATBgNVHSAEDDAKMAgG\n" \
"BmeBDAECATCCAQQGCisGAQQB1nkCBAIEgfUEgfIA8AB2AE51oydcmhDDOFts1N8/\n" \
"Uusd8OCOG41pwLH6ZLFimjnfAAABlMfpuIEAAAQDAEcwRQIhAKo8hJG2XFB2RmSf\n" \
"Do81b8wMVrBUFlxDm88m8h7ih58zAiBuPPnoOsDjxz/Gx0uASEyKB6NICRe02sN/\n" \
"Dr/mq16GiwB2ABNK3xq1mEIJeAxv70x6kaQWtyNJzlhXat+u2qfCq+AiAAABlMfp\n" \
"uS8AAAQDAEcwRQIgZ1yzNbCGAFF2/snEV5t5w1WOaff+R1ScJtajyK5xJRsCIQDv\n" \
"ueiUokWWRxDhnvXu0v3cek2IFvtxbPFnfn1HMQL0vzAKBggqhkjOPQQDAwNoADBl\n" \
"AjEAndoZPWX5hKx5WVaPlAMq64uvB9mh8HOJSvmqICEWFG8/ywJbNfwJNGL0UPPF\n" \
"vfhkAjAXm6M7LPdvCE4CuanMYs0OOWUCKkDiGxIRW8d6bc6NW+drMNcJZURj+TKQ\n" \
"cwWc1is=\n" \
"-----END CERTIFICATE-----\n";
/*
---
Server certificate
subject=CN=*.ngrok-free.app
issuer=C=US, O=Let's Encrypt, CN=E5
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: ECDSA
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 2392 bytes and written 403 bytes
Verification: OK
---
New, TLSv1.3, Cipher is TLS_AES_128_GCM_SHA256
Protocol: TLSv1.3
Server public key is 256 bit
This TLS version forbids renegotiation.
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_128_GCM_SHA256
    Session-ID: CA5D90A8C0B1D668E3D46410B530A805AE50DD63957960BAB0F1688BB0CF1DBA
    Session-ID-ctx: 
    Resumption PSK: A26E6C826C2A5FE503AE51B34B1292D6E0C30C8E58C44111E1C93841C1D756D0
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 604800 (seconds)
    TLS session ticket:
    0000 - 40 6c 6f 23 76 4b 39 23-fc 99 26 4d 95 6c 84 5c   @lo#vK9#..&M.l.\
    0010 - e9 dc da cb 3a 9e 76 26-33 fd 41 16 e6 63 ce 68   ....:.v&3.A..c.h
    0020 - 1e 69 86 6f 50 20 92 c7-d7 5a 00 75 af ed 79 51   .i.oP ...Z.u..yQ
    0030 - 15 ea 91 8c bb 6a 46 b5-61 92 7f 5d 9f 6c 32 40   .....jF.a..].l2@
    0040 - cd 03 cb 6d fd c1 c2 ba-9d ff 23 76 3d 55 c4 67   ...m......#v=U.g
    0050 - 48 90 86 29 99 89 ee 4c-20 89 a0 f2 93 3b d6 de   H..)...L ....;..
    0060 - 01 a5 26 dd 30 de f3 7b-5d                        ..&.0..{]

    Start Time: 1743677670
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
---
*/

using namespace websockets;

WebsocketsClient client;

void webSocketEvent(WStype_t type, uint8_t * payload, size_t length) {}

void onMessageCallback(WebsocketsMessage message) 
{
  Serial.print("Got Message: ");
  Serial.println(message.data());
}

void onEventsCallback(WebsocketsEvent event, String data) 
{
  if(event == WebsocketsEvent::ConnectionOpened) {
      Serial.println("Connnection Opened");
  } else if(event == WebsocketsEvent::ConnectionClosed) {
      Serial.println("Connnection Closed");
  } else if(event == WebsocketsEvent::GotPing) {
      Serial.println("Got a Ping!");
  } else if(event == WebsocketsEvent::GotPong) {
      Serial.println("Got a Pong!");
  }
}

void setup() {
    Serial.begin(115200);
    // Connect to wifi
    WiFi.begin(ssid, password);
    Serial.println("Connecting");
    // Wait some time to connect to wifi
    for(int i = 0; i < 10 && WiFi.status() != WL_CONNECTED; i++) {
        Serial.print(".");
        delay(1000);
    }
    Serial.println("");
    Serial.print("Connected to WiFi network with IP Address: ");
    Serial.println(WiFi.localIP());

    // Run callback when messages are received
    client.onMessage(onMessageCallback);
    // Run callback when events are occuring
    client.onEvent(onEventsCallback);

    // Before connecting, set the ssl fingerprint of the server
    client.setCACert(ngrok_ca_cert);
    // client.setInsecure();

    // Connect to server
    client.connect(websockets_connection_string);
    // Send a message
    client.send("Hello Server");
  
    // webSocket.begin("your.server.ip", 8080, "/");
    // webSocket.onEvent(webSocketEvent);

    // Send a ping
    client.ping();
}

void loop() {
    int analogReading = analogRead(FORCE_SENSOR_PIN);

    Serial.print("The force sensor value = ");
    Serial.print(); // print the raw analog reading

    if (analogReading < 10)       // from 0 to 9
      Serial.println(" -> no pressure");
    else if (analogReading < 200) // from 10 to 199
      Serial.println(" -> light touch");
    else if (analogReading < 500) // from 200 to 499
      Serial.println(" -> light squeeze");
    else if (analogReading < 800) // from 500 to 799
      Serial.println(" -> medium squeeze");
    else // from 800 to 1023
      Serial.println(" -> big squeeze");

    client.loop();
    String data = "{\"timestamp\":" + String(millis()) + ",\"force\":" + String(105) + "}"; //analogReading
    client.sendTXT(data);

    delay(1000);

    client.poll();
}
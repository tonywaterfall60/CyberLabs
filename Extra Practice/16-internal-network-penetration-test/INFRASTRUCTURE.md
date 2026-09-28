# EP16 Infrastructure

~~~text
172.28.16.0/28

172.28.16.10  ep16_web        nginx :80
172.28.16.11  ep16_api        Flask :5000
172.28.16.12  ep16_admin      nginx :8080
172.28.16.13  ep16_telemetry  Python :9000
~~~

No service is published to a host port.

The intended path is entirely inside the dedicated Docker network.

The range objective is supplied through the optional runtime variable RANGE_ARTIFACT. No private value is committed.
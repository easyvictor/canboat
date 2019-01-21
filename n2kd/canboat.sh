#!/bin/bash
/usr/bin/actisense-serial -r /dev/n2kforward | /usr/bin/analyzer -json | /usr/bin/n2kd

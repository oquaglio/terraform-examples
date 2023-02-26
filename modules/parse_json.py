#!/usr/bin/env python3

import json
import sys

json_string = sys.argv[1]
parsed_json = json.loads(json_string)

print(json.dumps(parsed_json))

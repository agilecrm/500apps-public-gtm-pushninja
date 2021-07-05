___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "categories": "MARKETING",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "PushNinja",
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAABCFBMVEUAAAAAAP9VVf8rgNUkbdsggN85ceMzgOYudOgrgOopeuAngOIugOQrd+Ype+YufOgreOMpfOMufOUteeYtfeMteecrfOQteucseuQsfOQrfOUte+Ute+QseuQse+UreuUre+Ure+QteuQtfOUreuYte+YtfOQse+Qre+UrfOUte+QteuUte+Yre+Ute+YsfOQre+Ure+YreuYre+Qte+Ute+YsfOYsfOQse+Yse+Use+Use+Yre+Qse+Use+Use+UseuQse+Use+Use+Use+Use+Use+Use+UteuUse+Yse+Use+Use+Use+Use+Use+Use+Use+Use+Use+Use+Yse+Use+X///8y/OYWAAAAVnRSTlMAAQMGBwgJCgsYGRocHh8hJCUnKC0/QklLTE5PVVZXWFlfYGFkZmdoamtyd3iBg4aHjY6ZmqCho6qus7W2ubrHysvM2Nvg4uTl5uvs7fLz9Pb3+Pn6/s7+4qMAAAABYktHRFd9CtkfAAABAklEQVQYGb3BaTcCUQAG4HfKVLaUabEkxFiyLyHCjMJUI9W47///KTqnjHunxjl98TyYTiSTz2ciCJO8bnOgfbWIiQ77ZKNWa5C9fUxwSnGzjAHjVvAEYzbpFTGy9SUKCIg73IPvgO8xqEw+a/BpFneheuA2JDu8h+qNSUiW+AqF5okoJFHhaZAl2IGiwwRkc3SgaHIWMoN1KOo0IFvlIxRPXIHsmBdQXPIIsipLUJRYhWTmQyxAMS8+dfzaoI0Am0X4tBeaCDBpa/hhsqkjQHdoYiTbZaUwpsJuFkMthmhhqHwXooz/l3LPgHM3hTDpPi2LvTRCrbuku4Y/xHO5GKbzDRUBNgZtRihdAAAAAElFTkSuQmCC"
  },
  "description": "Send a notification",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "api_key",
    "displayName": "Enter the api key.",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "region",
    "displayName": "Enter the region.",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const encodeUriComponent = require('encodeUriComponent');
const queryPermission = require('queryPermission');

// Reading the value's from fields
const api_key = encodeUriComponent(data.api_key);
const region = encodeUriComponent(data.region);
// Setting apikey to global variable.
if (queryPermission('access_globals', 'readwrite', '_push')) {
  setInWindow("_push",{"apiKey": api_key}, true);
}
// Setting region to global variable.
if (queryPermission('access_globals', 'readwrite', '_pushfcm')) {
  setInWindow("_pushfcm", {'location': region}, true);
}
log('data = verify', data);
const trackingUrl='https://infinity-public-js.500apps.com/push/push.min.js';
injectScript(trackingUrl,data.gtmOnSuccess,data.gtmOnFailure);
// Call data.gtmOnSuccess when the tag is finished.
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_push"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_pushfcm"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://infinity-public-js.500apps.com/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 7/5/2021, 7:17:18 PM



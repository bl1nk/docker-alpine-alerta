#!/bin/bash

cat >/app/config.js << EOF
'use strict';

angular.module('config', [])
.constant('config', {
    'endpoint':   "/api",
    'provider':   "$PROVIDER",
    'client_id':  "$CLIENT_ID",

    'colors': {
        'severity': {
            'critical':      '#D8122A',
            'major':         '#EA680F',
            'minor':         '#FFBE1E',
            'warning':       '#BA2222',
            'indeterminate': '#A6ACA8',
            'cleared':       '#00AA5A',
            'normal':        '#00AA5A',
            'ok':            '#00AA5A',
            'informational': '#00A1BC',
            'debug':         '#9D006D',
            'security':      '#333333',
            'unknown':       '#A6ACA8'
        },
        'text':              'white',
        'highlight':         'lightgray'
    }
});
EOF

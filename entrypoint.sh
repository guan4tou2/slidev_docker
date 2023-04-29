#!/bin/sh

npm config set registry https://registry.npm.taobao.org 

if [ -f /slidev/slides.md ]; then
    if [ -d /slidev/node_modules ]; then
        npm update
    else
        npm install
    fi
    echo "Start slidev..."
    sed -i '61d' node_modules/@slidev/client/internals/Editor.vue  #content.value = v
    npx slidev --remote=password
else
    echo "slides.md not found in the bind mount to /slidev"
    npm install @slidev/cli @slidev/theme-default @slidev/theme-seriph
    cp -f /slidev/node_modules/@slidev/cli/template.md /slidev/slides.md
    sed -i '61d' node_modules/@slidev/client/internals/Editor.vue  #content.value = v
    npx slidev --remote=password
fi

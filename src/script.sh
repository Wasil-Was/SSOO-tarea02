#!/bin/bash
curl -s https://api.warframe.market/v1/items | jq 'del(.payload.items[] ["thumb","url_name"])' > items.json
echo "JSON Creado con éxito."
exit 1

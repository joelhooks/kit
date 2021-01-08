#!/bin/sh
SIMPLE_NODE=$SIMPLE_PATH/node/bin/node

cli=(new edit simple)
for file in ${cli[@]}; do
    # Strip the path
    binName=${file##*/}
    # Strip the .js extension
    binName=${binName%.js}
    # Create the alias
    sed "s#{{name}}#$binName#g;s#{{SIMPLE_PATH}}#$SIMPLE_PATH#g;s#{{SIMPLE_NODE}}#$SIMPLE_NODE#g;s#{{type}}#cli#g" \
    $SIMPLE_PATH/config/template-bin > $SIMPLE_PATH/bin/$binName
    
    chmod +x $SIMPLE_PATH/bin/$binName
done
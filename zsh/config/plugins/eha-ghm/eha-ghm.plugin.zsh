function aws-env() {
    LAMBDA=$1
    while IFS=$'\t' read -r key val; do
        key=$(echo $key | sed 's/^"\(.*\)"$/\1/')
        export $key=$val
    done < <(aws lambda get-function --function-name $LAMBDA | jq -r '.Configuration.Environment.Variables | to_entries[] | [.key,.value] | @tsv')
}

#!/bin/zsh


while (true)
do
	echo 输入内容
 	read prompt
	control="quit"
	if [ ${prompt} != ${control} ]  
	then
	curl=`cat <<EOS
	curl https://api.openai.com/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${OPENAI_API_KEY}" \
  -d '{
  "model": "text-davinci-003",
  "prompt": "${prompt}",
  "temperature": 0,
  "max_tokens": 100,
  "top_p": 1
}' \
--insecure | jq '.choices[]'.text
EOS`
eval ${curl}
	else
		break
	fi
done


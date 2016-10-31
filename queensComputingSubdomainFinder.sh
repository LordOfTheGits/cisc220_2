#./bin/bash
echo -e "IP Address\tSubdomain"
echo ...

for (( subnet=0; subnet <= 255; subnet++ )); do 
	for (( host=0; host <= 255; host++ )); do
		url=$(nslookup 130.15.$subnet.$host | awk '{print $4'} | tail -n4 | head -n1 )
		url=${url[0]}
		if [[ ${#url}>=13 ]]; then
			url=${url:0:${#url}-1}
			if [[ ${url:(-13)} = 'cs.queensu.ca' ]]; then
				echo -e "130.15.$subnet.$host\t$url"
				echo ...
			fi
		fi
	done
done
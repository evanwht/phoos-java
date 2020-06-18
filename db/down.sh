if [[ $1 == "-rm" ]]; then
    docker-compose -f stack.yml down --rmi local
else
    docker-compose -f stack.yml down
fi

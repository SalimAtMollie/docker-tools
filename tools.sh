#!/bin/bash

YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NC=$(tput sgr0)

app () {
    #Check traefik, mysql and mailhog container status.
    running=$(docker-compose ps --services --filter "status=running")
    declare -a services=(reverse_proxy mailhog dns ngrok)
    i=1

    echo "Services available:"
    for service in "${services[@]}"
    do
        if [[ "$running" == *"$service"* ]]; then 
            echo "${GREEN}[$i] $service ${NC}" 
        else
            echo "${RED}[$i] $service ${NC}" 
        fi
        i=$((i+1))
    done

    read -n1 -r -p "${YELLOW}[?] Press a number to continue: ${NC}" num
    echo \

    echo "You have pressed ${services[num-1]}."

    if [[ "$running" == *"${services[num-1]}"* ]]; then 
        echo "${RED}Shutting down ${services[num-1]} ${NC}."
        docker-compose -f docker-compose-${services[num-1]}.yml down
    else
        echo "${GREEN}Starting up ${services[num-1]} ${NC}."
        docker-compose -f docker-compose-${services[num-1]}.yml up --build -d --remove-orphans
    fi
    
    app
}

#Welcome the User
echo "Tooling Container.
KEY:
   - ${RED} Red: Service not running. ${NC}
   - ${GREEN} Green: Service is running. ${NC}"

#Open Docker, only if is not running
if (! docker stats --no-stream >/dev/null); then
    echo "${RED}[!] Docker is not up. Attempting to start docker. ${NC}"
    # On Mac OS this would be the terminal command to launch Docker
    open /Applications/Docker.app
    echo "${YELLOW}[!] Launching docker. Please wait while it launches.${NC}"
    # Wait until Docker daemon is running and has completed initialisation
    while (! docker stats --no-stream >/dev/null); do
        # Docker takes a few seconds to initialize
        echo "${YELLOW}[!] Docker is currently launching... Please wait.${NC}"
        sleep 20
    done
fi

app
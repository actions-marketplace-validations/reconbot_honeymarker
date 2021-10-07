FROM golang:1.17-buster

LABEL "com.github.actions.name"="Honeycomb Honeymarker Github Actions"
LABEL "com.github.actions.description"="Add Honeycomb Markers to your GitHub Actions workflows."
LABEL "com.github.actions.color"="yellow"
LABEL "com.github.actions.icon"="activity"

LABEL "repository"="https://github.com/reconbot/gha-honeymarker"
LABEL "homepage"="https://github.com/reconbot"
LABEL "maintainer"="Francis Gulotta <wizard@roborooter.com>"

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		jq \
	; \
	rm -rf /var/lib/apt/lists/*

RUN go get github.com/honeycombio/honeymarker

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

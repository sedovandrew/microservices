export USERNAME=advu
export REDDIT_UI_VERSION=`cat ui/VERSION`
export REDDIT_COMMENT_VERSION=`cat comment/VERSION`
export REDDIT_POST_VERSION=`cat post-py/VERSION`
export REDDIT_MONGO_VERSION=3.2
export REDDIT_PROMETHEUS_VERSION=`cat prometheus/VERSION`
export REDDIT_ALERTMANAGER_VERSION=`cat alertmanager/VERSION`

export REDDIT_PORT=9292
export REDDIT_PROMETHEUS_PORT=9090
export REDDIT_CADVISOR_PORT=8080
export REDDIT_GRAFANA_PORT=3000
export REDDIT_ALERTMANAGER_PORT=9093

echo UI version is $REDDIT_UI_VERSION
echo Comment version is $REDDIT_COMMENT_VERSION
echo Post version is $REDDIT_POST_VERSION
echo MongoDB version is $REDDIT_MONGO_VERSION
echo Prometheus config version is $REDDIT_PROMETHEUS_VERSION

# Run this command to configure your shell:
#     source ./env.sh

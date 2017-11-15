export REDDIT_UI_VERSION=`cat ui/VERSION`
export REDDIT_COMMENT_VERSION=`cat comment/VERSION`
export REDDIT_POST_VERSION=`cat post-py/VERSION`
export REDDIT_PROMETHEUS_VERSION=`cat prometheus/VERSION`
export REDDIT_ALERTMANAGER_VERSION=`cat alertmanager/VERSION`

echo UI version is $REDDIT_UI_VERSION
echo Comment version is $REDDIT_COMMENT_VERSION
echo Post version is $REDDIT_POST_VERSION
echo Prometheus config version is $REDDIT_PROMETHEUS_VERSION
echo AlertManager config version is $REDDIT_ALERTMANAGER_VERSION

# Run this command to configure your shell:
#     source ./env.sh

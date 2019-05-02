touch /var/lock/subsys/local
exec 2> ~/logs/stdout.log  # send stderr from rc.local to a log file
exec 1>&2                      # send stdout to the same log file
set -x
rm -rf ~ec2-user/HillClimbingCloud
git clone https://github.com/MiguelFreire/HillClimbingCloud.git ~ec2-user/HillClimbingCloud
export CLASSPATH="~ec2-user/HillClimbingCloud"
export _JAVA_OPTIONS="-XX:-UseSplitVerifier "$_JAVA_OPTIONS
/usr/bin/java -cp ~ec2-user/HillClimbingCloud pt.ulisboa.tecnico.cnv.server.WebServer
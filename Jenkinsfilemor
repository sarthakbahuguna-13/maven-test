node {
def mavenHome = tool name: "maven-1"

stage('checkout'){

git 'https://github.com/sanchitraj35/maven-test.git'
}

//build stage
/*
stage('build'){

sh "$mavenHome/bin/mvn clean package"
}
//deploy stage
stage('deploy'){
sshagent(['66bf1d2a-aed0-43f2-9db7-43cface39efe']) {
 sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@3.235.225.165:/opt/apache-tomcat-11.0.14/webapps" 
}
}
*/
}

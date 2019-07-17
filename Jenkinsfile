pipeline {
     agent any
     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
         
		   //stage("Code coverage") {
  //   steps {
         // sh "./gradlew jacocoTestReport"
         // sh "./gradlew jacocoTestCoverageVerification"
     //}z
//}
		  
stage("Package") {
     steps {
          sh "./gradlew build"
     }
}

stage("Docker build") {
     steps {
	     
          sh "docker build -t monusraj/jenkins ."
     }
}

stage("Docker push") {
     steps {
	  sh "docker login -u monusraj -p 25900519"

          sh "docker push monusraj/jenkins"
     }
}
stage("Deploy to staging") {
     steps {
	
         // sh "docker run -d --rm -p 8765:8080 --name calculator_1 nikhilnidhi/calculator_1"
		 sh "docker-compose up -d"
     }
}

stage("Acceptance test") {
     steps {
          sleep 60
	  sh    "chmod +x ./acceptance_test_docker.sh"
          sh "./acceptance_test_docker.sh"
     }
}
     }
	 post {
     always {
         sh "docker-compose down"
     }
}
}

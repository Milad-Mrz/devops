#!/bin/sh

# Determine the directory where this script resides so that it can be executed
# from any location. The project root is the parent directory of this script.
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Ensure the target directory exists
mkdir -p "$PROJECT_ROOT/target"

# Copy the built application JAR from the main Maven project. This JAR is needed
# for the integration tests to run correctly.
cp "$PROJECT_ROOT/../MavenHelloWorldProject/target/MavenHelloWorldProject-1.0-SNAPSHOT.jar" \
   "$PROJECT_ROOT/target/"

# Execute the integration test JAR produced by this project. The assembly plugin
# creates a JAR with all dependencies bundled, suffixed with
# '-jar-with-dependencies'.
java -jar "$PROJECT_ROOT/target/ITMavenHelloWorldProject-1.0-SNAPSHOT-jar-with-dependencies.jar"




mkdir -p classes
javac --release 11 -encoding UTF-8 -d classes src/Assistente.java
jar cfm AssistentePortugol.jar manifest.mf -C classes .

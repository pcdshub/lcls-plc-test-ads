@echo off
echo Starting Typhon...
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Users\awallace\Documents\Source\ADS_Testing\\:/reg/g/pcds/epics/ioc/ADS_Testing" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/ADS_Testing/iocBoot/ioc-TestProj' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/ADS_Testing/ADS_Testing/ADS_Testing.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py; sleep 1"

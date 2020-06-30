# Attack simulation infrastructure

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [What is it?](#what-is-it)
- [What is it for?](#what-is-it-for)
- [Used software](#used-software)
- [Requirements](#requirements)
- [Usage](#usage)
- [ToDos](#todos)
- [Disclaimer](#disclaimer)

<!-- /TOC -->

## What is it?

This is a simple setup with (actual) 3 VMs.
One VM is used as companies web appearance / intranet. The second one is its syslog server. The last one is playing the role of an attacker/hacker.

## What is it for?

[IT IS JUST FOR EDUCATIONAL USE!](#disclaimer)

I developed this small setup for some courses at the TU Wien (Technical University of Vienna). It is/was used to create networking dumps of several attacks for forensic student tasks.

Anyhow, I think this project can show people 

+  how attacks are performed
+  how to find vulnerabilities
+  how to detect them
+  how to do some digital forensics
+  and most important, how to protect yourself.






## Used software

+  Hydra (https://github.com/vanhauser-thc/thc-hydra)
+  tshark (https://www.wireshark.org/docs/wsug_html_chunked/AppToolstshark.html)
+  nmap
+  nc

## Requirements 

+  Vagrant >= 1.6.5 (https://www.vagrantup.com/)
+  VirtualBox >= 4.3.30 (https://www.virtualbox.org/)
+  Linux/Os X environment 

## Usage

First of all you need to install the required software.

Give run.sh execute rights

```sh
chmod +x run.sh
```

Now you just need to run this script

```sh
./run.sh
```

That's it! Now all 3 VMs will be set up. Follow the dialogue to start the attacks.

Be patient, some attacks need time (bruteforce with Hydra).
After all is done, you will find **attack.log** and **lanDump.pcap** in the projects directory.

## ToDos

+  revise Readme (add description of VMs, infrastructure and attacks)
+  add attacks
+  add screenshots & documentation
+  after 3 years... maybe port it to docker?! :)

## Disclaimer
<a name="disclaimer"></a>
Any activities and or actions related to the material contained within this project is solely your responsibility. The misuse of the information in this project can result in criminal charges brought against the persons in question. The contributors will not be held responsible in the event any criminal charges be brought against any individuals misusing the information in this project to break the law.

This project contains materials that can be potentially damaging or dangerous. Refer to the laws in your province/country before using, or in any other way utilizing these materials. These materials are for educational and research purposes only. Do not attempt to violate the law with anything contained here.

prj=01.verySimpleRole
if [ $0 = "./$prj.sh"  ]; then


echo --------------------------------------------------------------------------------
echo tree $prj
echo --------------------------------------------------------------------------------
tree $prj
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo ansible-playbook -i ./$prj/hosts.ini ./$prj/site.yml
echo --------------------------------------------------------------------------------
ansible-playbook -i ./$prj/hosts.ini ./$prj/site.yml
echo --------------------------------------------------------------------------------
echo --------------------------------------------------------------------------------
echo curl n3
echo --------------------------------------------------------------------------------
curl n3
echo --------------------------------------------------------------------------------


else 
   echo execute by ./$prj.sh
fi
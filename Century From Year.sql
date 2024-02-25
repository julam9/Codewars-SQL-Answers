select yr, case when yr%100 = 0 then yr/100
else floor((yr+100)/100) 
end as century
from years
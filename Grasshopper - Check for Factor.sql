select id, case 
when base%factor=0 then true 
else false 
end as res
from kata
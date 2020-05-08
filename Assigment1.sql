select [Person id] as 'properties.Person_id'
, [floor access datetime] as 'properties.floor_access_date_time',
[floor level] as 'properties.floor_level'
,[building] as 'properties.building'
from dbo.data where [person id]=1
for JSON PATH,root('Floor Access Event')

select * from dbo.data
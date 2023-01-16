-- Fillpath test for file by id
SELECT 
    CONCAT(FullPath(parent), '\\\\', name) AS fullname
 FROM files 
 WHERE (id=XXX);

-- Folder content by id
SELECT 
    id, 
    'FOLDER' AS type, 
    name 
 FROM folders
 WHERE (parent=XXX)
  UNION    
 SELECT 
    id, 
    'FILE' AS type, 
    name 
 FROM files
 WHERE (parent=:id)

-- Input bij die velden t XXX id
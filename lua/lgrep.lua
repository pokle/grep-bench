filename = "~/Downloads/in/residential.ldif"
fp = io.open( filename, "r" )
 
for line in fp:lines() do
    -- print( line )
end
 
fp:close()

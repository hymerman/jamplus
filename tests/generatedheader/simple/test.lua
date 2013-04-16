function Test()
	-- Test for a clean directory.
	local originalFiles =
	{
		'Jamfile.jam',
		'main.c',
		'test.c',
	}

	local originalDirs =
	{
	}

	RunJam{ 'clean' }
	TestDirectories(originalDirs)
	TestFiles(originalFiles)

	if Platform == 'win32' then
		-- First build
		local pattern = [[
*** found 20 target(s)...
*** updating 6 target(s)...
@ C.vc.CC <win32!release:test>main.obj
!NEXT!@ C.vc.Link <win32!release:test>test.exe
*** updated 6 target(s)...
]]

		TestPattern(pattern, RunJam())

		local pass1Dirs = {
			'win32-release/',
			'win32-release/test/',
		}
		
		local pass1Files =
		{
			'Jamfile.jam',
			'main.c',
			'test.c',
			'test.h',
			'win32-release/test/main.obj',
			'win32-release/test/test.obj',
			'win32-release/test/test.release.exe',
			'?win32-release/test/test.release.exe.intermediate.manifest',
			'win32-release/test/test.release.pdb',
		}

		TestFiles(pass1Files)
		TestDirectories(pass1Dirs)

		local pattern2 = [[
*** found 20 target(s)...
]]
		TestPattern(pattern2, RunJam())
	
		os.sleep(1.0)
		os.touch('test.h')

		local pattern3 = [[
*** found 20 target(s)...
*** updating 2 target(s)...
@ C.vc.CC <win32!release:test>main.obj
!NEXT!@ C.vc.Link <win32!release:test>test.exe
!NEXT!*** updated 2 target(s)...
]]
		TestPattern(pattern3, RunJam())
	
	else

		-- First build
		local pattern = [[
*** found 11 target(s)...
*** updating 5 target(s)...
@ C.gcc.CC <macosx32!release:test>main.o 
@ C.gcc.CC <macosx32!release:test>test.o 
@ C.gcc.Link <macosx32!release:test>test 
*** updated 5 target(s)...
]]

		TestPattern(pattern, RunJam())

		local pass1Dirs = { 
			'macosx32-release/',
			'macosx32-release/test/',
		}

		local pass1Files = { 
			'Jamfile.jam',
			'main.c',
			'test.c',
			'test.h',
			'test.lua',
			'macosx32-release/test/main.o',
			'macosx32-release/test/test.o',
			'macosx32-release/test/test.release',
		}	

		TestFiles(pass1Files)
		TestDirectories(pass1Dirs)

		local pattern2 = [[
*** found 11 target(s)...
]]
		TestPattern(pattern2, RunJam())

		os.sleep(1.0)
		os.touch('test.h')

		local pattern3 = [[
*** found 11 target(s)...
*** updating 2 target(s)...
@ C.gcc.CC <macosx32!release:test>main.o 
@ C.gcc.Link <macosx32!release:test>test 
*** updated 2 target(s)...
]]
		TestPattern(pattern3, RunJam())

	end

	RunJam{ 'clean' }

	TestDirectories(originalDirs)
	TestFiles(originalFiles)
end


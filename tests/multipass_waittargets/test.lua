function Test()
	-- Test for a clean directory.
	local originalFiles =
	{
		'Jamfile.jam',
		'Pass2.jam',
	}

	local originalDirs =
	{
	}

	RunJam{ 'clean' }
	TestDirectories(originalDirs)
	TestFiles(originalFiles)

	---------------------------------------------------------------------------
	local pattern = [[
Pass 1
*** found 3 target(s)...
*** executing pass 2...
Pass 2
*** found 3 target(s)...
*** updating 2 target(s)...
@ WriteFile originalfile.txt
@ Copy copiedfile.txt
!NEXT!*** updated 2 target(s)...
]]

	TestPattern(pattern, RunJam())

	local pass1Files =
	{
		'Jamfile.jam',
		'Pass2.jam',
		'copiedfile.txt',
		'originalfile.txt',
	}

	local pass1Directories = {
		'?.build/',
	}

	TestDirectories(pass1Directories)
	TestFiles(pass1Files)

	---------------------------------------------------------------------------
	local pattern2 = [[
Pass 1
*** found 3 target(s)...
*** executing pass 2...
Pass 2
*** found 3 target(s)...
]]

	TestPattern(pattern2, RunJam())
	TestDirectories(pass1Directories)
	TestFiles(pass1Files)

	---------------------------------------------------------------------------
	local cleanpattern = [[
Pass 1
*** found 2 target(s)...
*** updating 1 target(s)...
@ Clean clean
*** updated 1 target(s)...
*** executing pass 2...
Pass 2
*** found 1 target(s)...
*** updating 1 target(s)...
@ Clean clean
*** updated 1 target(s)...
]]
	TestPattern(cleanpattern, RunJam{ 'clean' })
	TestFiles(originalFiles)
	TestDirectories(originalDirs)
end

TestChecksum = Test

rem Build game in dist/reminiscence for all PC platforms with Ruby Ship
rem The distribution is cross-platform, but this script must be run from Windows

rem Dependency: Ruby Ship (a copy of the ruby_ship repository must be installed)

rem Arguments: pass the path to ruby_ship repository copy as 1st argument %~1
rem If no arguments are passed, only the game source will be copied. This is useful
rem when you have already copied Ruby Ship and only need to update the game.
rem On Windows, robocopy will not copy the same files twice, but just checking them 

rem Bundle the game with a copy of Ruby thanks to the Ruby Ship default (Ruby 2.2)
mkdir -p dist/all
rem Copy the distribution of Ruby if indicated
IF NOT [%1] == [] robocopy /mir /xo %1 dist\all\ruby_ship
rem Copy src folder to dist\all
robocopy /mir /xo src dist\all\src
rem Use /e to avoid removing files copied above (it will not remove old scripts,
rem so make sure to remove them manually)
robocopy /e /xo scripts dist\all

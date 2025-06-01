#!/bin/bash

#exec git reset --hard main ## resets the git file to remove any local changes and thus allow git to replace it without error
exec git -C ~/Flakes/ pull origin main #Does the deed

end

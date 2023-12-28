create_private_dir:
   file.directory:
    - name: /media/private/
    - makedirs: True
create_sync_movies_dir:
   file.directory:
    - name: /media/sync_movies/
    - makedirs: True


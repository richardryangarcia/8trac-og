# 8trac

## MetaMask Accounts

[Hector Zarate](https://github.com/hectorzarate)
0x72e8088772BE332a95A289F3aC47f83a39675dDd




https://youtu.be/jNU2J8R50u0

## Setup Environment

### Make sure rails is setup on your local machine.
* [Mac OSX Guide](https://gorails.com/setup/osx/10.12-sierra)
* [Windows Guide](https://gorails.com/setup/windows/10)
* [Linux](https://gorails.com/setup/ubuntu/16.10)

### Read the following notes before starting the above guides

#### Rails

Rails version 4.2.5, so when you reach the point of installing rails in the above guides, make sure to use the
following command:

```
gem install rails -v 4.2.5
```

#### MySQL
MySQL for the database, you'll need to setup a user with full permissions and the following two local databases:

```
shell> mysql -h localhost -u root -p
Enter password: ********
mysql> CREATE DATABASE eighttrac_development;
mysql> CREATE DATABASE eighttrac_production;
mysql> CREATE USER 'eighttrac'@'localhost' IDENTIFIED BY 'eighttrac2018';
mysql> GRANT ALL ON eighttrac_development.* TO 'eighttrac'@'localhost';
mysql> GRANT ALL ON eighttrac_production.* TO 'eighttrac'@'localhost';
mysql> FLUSH PRIVILEGES;
mysql> exit
```

## Setting up the Project
1. Clone git repo onto local machine
    ```
    shell> git clone https://github.com/HectorZarate/8trac.git
    ```

2. Download and update dependencies
    ```
    shell> bundle install
    shell> bundle update
    ```

3. Create database tables with current schema for this first time
    ```
    shell> rake db:schema:load
    ```

4. Populate database data with initial records needed
    ```
    shell> rake db:seed
    ```

5. Start the server
    ```
    shell> rails server
    ```

6. Navigate to home page in browser
    ```
    http://localhost:3000
    ```

7. Should be greeted with Login page.
8. Create and account and login.

## Committing changes

Use the following process when creating features/changes and committing to the project.
The main idea here with squashing is to end up with just a single commit that includes all your changes to the branch,
that way when you merge into master, you'll be able to do it cleanly and the network graph for commits and merges should
show a single straight line.

1. Create a separate branch
    ```
    shell (master)> git checkout -b <new-branch-name>
    ```

2. Make changes in branch
    ```
    ----- Make some changes to code.... -----
    shell (new-branch-name)> git add .
    shell (new-branch-name)> git commit -m "Adding some chagnes to new branch"
    shell (new-branch-name)> git push origin <new-branch-name>
    ----- Make some more changes .... -----
    shell (new-branch-name)> git add .
    shell (new-branch-name)> git commit -m "Adding more changes to branch"
    shell (new-branch-name)> git push origin <new-branch-name>
    ----- Make some more changes .... -----
    shell (new-branch-name)> git add .
    shell (new-branch-name)> git commit -m "Again added more changes to branch"
    shell (new-branch-name)> git push origin <new-branch-name>
    ```

3. Squash all changes into one commit
    ```
    shell (new-branch-name)> git rebase -i HEAD~3
    ```

4. This will open up your editor with the following:
    ```
    pick f392171 Adding some chagnes to new branch
    pick ba9dd9a Adding more changes to branch
    pick df71a27 Again added more changes to branch
    ```
    Now you can tell git what to do with each commit. Let’s keep the first commit, f392171, the one were we added our
    feature. We’ll squash the following two commits into the first one - leaving us with one clean commit with all the
    changes from all the commits put into one.

5. Change your file to this, then save and quit:
    ```
    pick f392171 Adding some chagnes to new branch
    squash ba9dd9a Adding more changes to branch
    sqaush df71a27 Again added more changes to branch
    ```

6. Git will then give you the opportunity to change your commit message to something like, "Issue #100: Fixed retweet
bug."You can uncomment any lines in the file you would like to leave in the commit message. Save and quit the file.


7. Now we have our compact, single commit ready to push and override all the single commits we made to our branch.
   ```
   shell (new-branch-name)> git push origin <new-branch-name> --force
   ```

8. Now, before we merge into master, we want to make sure our branch is up to date with all the changes/merges that
could have been made on the master branch since the time this branch was created.
This will pull any changes from master into your current branch and put your changes back on top.
Resolve any conflicts as necessary.
    ```
    shell (new-branch-name)> git rebase master
    ```

9. Now we can merge our branch into master without issue
    ```
    shell (new-branch-name)> git checkout master
    shell (master)> git merge <new-branch-name>
    ```

10. Delete the branch, we will not use it anymore.
    ```
    shell (master)> git push origin --delete <new-branch_name>
    shell (master)> $ git branch -d <new-branch_name>
    ```

11. Repeat process.

## Creating DB changes

We will be using Rails migrations to manage changes to our database.

[Read more about Rails migrations ](http://guides.rubyonrails.org/v3.2/migrations.html)

We will use native sql in our migrations and NOT use our models like you might see in the above guide.
This is because models may change and break our migrations in the future, so using native SQL statements
instead is the better choice and is the acceptable practice by the rails community.

Use Cases and steps:

#### Adding a new table or updating schema

1. Generate a migration file
    ```
    shell> rails generate migration MyNewTableMigration
    ```

2. This will create an empty but appropriately named migration:
    ```
    Location: /8trac/db/migrate/20170224050352_my_new_table_migration.rb
    ```
    ```
    class MyNewTableMigration < ActiveRecord::Migration
     def change
     end
    end
    ```

3. We will not use the 'change' method, but instead will use the 'up' and 'down' methods. Up will contain sql for the
changes we'd like to make, and Down will contain sql that will remove those changes in the case of a rollback.

4. Edit the file to look like the following:
    ```
    class MyNewTableMigration < ActiveRecord::Migration
     def up
        execute <<-SQL
          CREATE TABLE MyNewTable (
          id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          firstname VARCHAR(30) NOT NULL,
          lastname VARCHAR(30) NOT NULL,
          email VARCHAR(50),
          reg_date TIMESTAMP
          );
        SQL
     end

     def down
        execute <<-SQL
          DROP TABLE MyNewTable;
        SQL
     end
    end
    ```

5. Once you have the sql you'd like to run inputed into these up and down functions, we can continue with applying them
to your local database.

6. Run the following command to complete the migration. Note, you cannot use the rails app until you finalize the
migration with the following command, or delete the migration file.
    ```
    rake db:migrate
    ```

7. This will do the following things:

    * Executes your sql on your local database

    * Updates the version number on the schema_migrations table

    * Updates the schema.rb file to reflect the current schema of the database (That way if you have a fresh db install and run `rake db:schema:load`, you'll have all the changes.)

8. If you're happy with the db changes, make sure to add the created migration file to your commit with the rest of your
 code before you push.

9. If you're not happy with your db changes and would like to adjust them, do the following

    * Perform a rollback `rake db:rollback`

    * Edit the migration file with any changes you'd like to make, or just delete the file and generate a new one.

    * Apply the migration again `rake db:migrate`

10. All set, now when another use pulls your code they can just run `rake db:migrate` to pick up your changes`

#### Adding data into existing tables

1. Edit the following file and add your INSERT statements
    ```
    /8trac/db/seeds.rb
    ```

2. Run the following command to execute it
    ```
    rake db:seed
    ```

3. If you don't want these records duplicated when the above command is executed multiple times,
make sure to include a 'DELETE * FROM table' statement before your INSERT statements that you add to make sure the
table is cleaned out each time before the insertions. Of course, don't do this if there is other data you'd like to
preserve in the table.

### Import database schema on a new or cleaned DB environment
1. With an existing local eighttrac_development database that contains no tables, run the following command.
    ```
    rake db:schema:load
    ```

### Just pulled code that contains a new migration(s)
1. Catch your database up with the following command
    ```
    rake db:migrate
    ```

### Populate tables with initial data
1. Populate your tables with sql from seeds.rb by using the following command.
    ```
    rake db:seed
    ```

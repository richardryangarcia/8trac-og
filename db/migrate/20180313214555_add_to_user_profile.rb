class AddToUserProfile < ActiveRecord::Migration
  def up
#     execute "alter table users add column first_name varchar(250);"
#     execute "alter table users add column last_name varchar(250);"
#     execute "alter table users add column user_type varchar(250);"
#     execute "CREATE TABLE `instruments` (
#   `id` int(11) NOT NULL AUTO_INCREMENT,
#   `name` varchar(250) DEFAULT NULL,
#   `symbol` varchar(50) DEFAULT NULL,
#   `state` varchar(50) DEFAULT NULL,
#   `tradeable` varchar(50) DEFAULT NULL,
#   `robinhood_id` varchar(250) DEFAULT NULL,
#   `open_price` decimal(13,10) DEFAULT NULL,
#   `high` decimal(13,10) DEFAULT NULL,
#   `low` decimal(13,10) DEFAULT NULL,
#   `volume` decimal(15,15) DEFAULT NULL,
#   `average_volume` decimal(15,15) DEFAULT NULL,
#   `high_fifty_two_weeks` decimal(13,10) DEFAULT NULL,
#   `dividend_yield` decimal(13,10) DEFAULT NULL,
#   `low_fifty_two_weeks` decimal(13,10) DEFAULT NULL,
#   `market_cap` decimal(13,10) DEFAULT NULL,
#   `description, status` text,
#   `fundamentals_url` text DEFAULT NULL,
#   `opening_date` date,
#   `closing_date` date,
#   `total_supply` int(11) not null default 0,
#   `participant_limit` int(11) not null default 0,
#   `rights_for_revenue` decimal(13,10) default 0.0,
#   `fundraising_amount` decimal(13,10) default 0.0,
#   PRIMARY KEY (`id`)
# );"
  execute "alter table instruments add column status varchar(250);"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Last Call','Great Dane', 43.0, 'https://images.unsplash.com/photo-1518799937599-77763326c394?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=c5a65f6eae0ec8a259a43000ef7b1541', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Abberation','Cresendo', 100.0, 'https://images.unsplash.com/photo-1519635691-315df31c18a3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=704054f690f29b0668a387606bb16b37', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Released')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Tides','Candy', 76.0, 'https://images.unsplash.com/photo-1519474455542-45a31d80f280?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=9f969fae51a49966f8b000d62313a9f7', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Odyssey','Toby Fox', 100.0, 'https://images.unsplash.com/photo-1519687774292-8ef26b975fc4?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=68504503eedd726d4f3da3c34f0cef2d', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Recording')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Simulation & Emulation','Louie Zong', 12.0, 'https://images.unsplash.com/photo-1520526790755-e31ace504b3f?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=1af1feef3a49a666159c55faf152a020', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Piss Factory','Sun Ra', 100.0, 'https://images.unsplash.com/photo-1519156892420-a61fb5543505?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=1838fe365eeae5f128549362bbe06287', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Mastering')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Sepia','Filthy Casual', 56.0, 'https://images.unsplash.com/photo-1519066742-c63a92e02298?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=a66b0f0ae066ff3bcf8224c00e34d8f7', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Astral Black','Howie Lee', 39.0, 'https://images.unsplash.com/photo-1520528536519-199b4ed22fdc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=e41ca5dea3e1f306939cf1b5be91c2fc', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Aqua','Mega Tapes', 61.0, 'https://images.unsplash.com/photo-1518722221186-acff537bd8ea?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=8de8dffeb47f3565e3070245882c2e45', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Gods Plan','Field Trip', 90.0, 'https://images.unsplash.com/photo-1520214506452-92aa5defe1b3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=a34ce51ae09a6ec7162ed19aee1b9113', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Deploy','Back to 84', 88.0, 'https://images.unsplash.com/photo-1520441369516-8b961cf0af1c?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=1d462eb06f4e589ce1898891d8de1b34', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('On the Brink','Film Junk', 45.0, 'https://images.unsplash.com/photo-1519452278889-1cd5f64a1a13?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=d5a85522e4b434a87b473bae75866da3', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Melting Ice','Pie Face Girls', 33.0, 'https://images.unsplash.com/photo-1520320142774-5381578416fa?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=d06755cb673c0d5392171392fe610227', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Emergon','Terrekke', 13.0, 'https://images.unsplash.com/photo-1520697165497-c9247d67370e?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=44ff63701fc367ff33b2f16191317475', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Never Say Goodbye','Ben Prunty', 43.0, 'https://images.unsplash.com/photo-1520116647936-d5e8570bdf8a?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=4e5050315f18492922e884c2f8c5d31a', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Leather Teeth','Weaponise', 65.0, 'https://images.unsplash.com/photo-1520583961470-aecd3fd1f6fb?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=ed6584a86fafd1168e784e404077f234', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Trilogy','Watchdogs', 76.0, 'https://images.unsplash.com/photo-1519256155806-cd510524ed97?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=687e0c23bd814fe6c2970613949b0cf3', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Recoinnter','The Sizlacks', 54.0, 'https://images.unsplash.com/photo-1520844828528-3cb57c04fd6b?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=b82ec58030f8e1e98413ff53e84cc489', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Cro Magnox','Spectral Voice', 24.0, 'https://images.unsplash.com/photo-1519253577721-083d740006e5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=5842128ba20f900172afe3106cd6313d', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Baby Maker','Dub Creator', 26.0, 'https://images.unsplash.com/photo-1520264834865-7effb972c224?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=899b2c47ddd781d12fb76e0529516efc', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Forward','Nuerosis', 30.0, 'https://images.unsplash.com/photo-1520404209763-4699fa7f15f5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=5b4dc2b2eac2b3bf210a3d99bb6c22fb', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Hey, Space Cadet','Hot Snakes', 76.0, 'https://images.unsplash.com/photo-1519078327-cc614a22612e?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=0be6c060de3242757a90aeab7bbfddba', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"
  execute "insert into instruments (name, symbol, open_price, fundamentals_url, description, status) values ('Sick Puppy','Dear Nora', 65.0, 'https://images.unsplash.com/photo-1519558035158-5841a5942707?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=500&h=500&fit=crop&s=32e4a1dff0bf0869d3b972f94fa710df', 'In west Philadelphia born and raised
On the playground where I spent most of my days
Chilling out, maxing, relaxing all cool
And all shooting some b-ball outside of the school
When a couple of guys, they were up to no good
Started making trouble in my neighbourhood
I got in one little fight and my mom got scared
And said Youre moving with your auntie and uncle in Bel-air
I whistled for a cab and when it came near the
License plate said fresh and had a dice in the mirror
If anything I could say that this cab was rare
But I thought nah, forget it, yo homes to Bel-air!
I pulled up to a house about seven or eight
And I yelled to the cabby Yo, homes smell you later!
Looked at my kingdom I was finally there
To sit on my throne as the prince of Bel-air', 'Funding in Progress')"

  end

  def down
    execute "alter table users drop column first_name;"
    execute "alter table users drop column last_name;"
    execute "alter table users drop column user_type;"
    execute "drop table if exists instruments;"
  end
end

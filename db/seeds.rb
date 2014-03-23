# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


# Sorry I wasn't able to finish it. Here's what I have so far.
# I would like a groupgrant that's about the mission run. I think
# it would connect with the student body. I already created a charity called
# Bearing Precious Seed. - Koffi

# Warning: not all of this has been tested. To use the seed file, clear your database by using
# rake db:shema:load.  Then run db:seed - Koffi

# The following are the same for all accounts
password     =  "groupgrant"

# Create category for businesses and charities
cCategories = ["Animals", "Arts and Culture", "Education", "Environment", 
				"Health", "Human Services", "International", "Public Benefit", 
				"Religion", "Other"]
bCategories = ["Animals", "Education", "Food Services", "Environment", "Health",
			   "Human Services", "Public Benefit", "Finance", "Other", "Entertainment" ]
cCategories.count.times do |c|
	charity  = CharityCategory.create(name: cCategories[c])
end	

bCategories.count.times do |c|
	business = BusinessCategory.create(name: bCategories[c])
end				 

###################################################################################
#						Populate the database with charities 					  #
###################################################################################
# The data for the charity names and their descriptions were mainly found at 
# charitynavigator.org
charityNames = ["4 Paws for Ability", "African Wildlife Foundation", "Alley Cat Allies",
				"Arizona-Sonora Desert Museum", "Lindsay Wildlife Museum","Virginia Living Musuem",
				"Academy of Achievements", "ACE Scholarships", "A Beka Foundation",
				"A Place Called Home","Acterra", "Wyman Center", 
				"Action on Smoking and Health", "Acumen Fund", 
				"Alexander Graham Bell Association for the Deaf and Hard of Hearing",
				"Baptist Children's Home of NC", "Bread of Life Missions",
				"Dare To Care Food Bank", "All God's Children", "HIAS", 
				"Matthew 25 ministries","Be the Match Foundation","Advocates International",
				"Hands On Atlanta","Africa Bible Colleges Inc.", "Child Evangelism Fellowship",
				"Answers In Genesis","Youths for Christ","Senioritis Coorporation",
				"Days End Farm horse Rescue", "Civil War Trust","Boston Philharmonic Orchestra"
				]

charityEmail = ["4paws@charities.org","wildlife@safari.org","alleycats@animals.org",
				"deserts@comcast.net", "LWM@museums.org", "VLM@gmail.com", 
				"educationforall@gmail.com", "ACE@Scholarships.org", "ABF@yahoo.com",
				"homes4you@charities.org", "Acterra@acterra.com", "center@wyman.org",
				"quitsmoking@health.com", "acumen@gmail.com","AGB@deafministries.org",
				"BCHNC@bellsouth.net","BreadofLife@missions.org","DTCFB@gmail.com",
				"GodsChildren@yahoo.com", "HIAS@hias.org","Matthew25@ministries.org",
				"btmf@gmail.com", "AI@Advocates.org","HOA@gmail.com","ABCI@gmail.com",
				"CEF@gmail.com", "AIG@aig.org","YFC@groupgrant.org",
				"senioritis@seniors.org", "horses@daysend.org", "civilWar@trust.org",
				"BPO@philharmonic.org"]

# Descriptions for each charity, in order. 				
descriptions = "Our goal is to enrich the lives of people with disabilities by the training and placement of service dogs to provide individuals with companionship and promote independent living;",

				# African Wildlife Foundation
				"Founded in 1961, the African Wildlife Foundation (AWF), together with the people of Africa, works to ensure the wildlife and wild lands of Africa will endure forever.",

				# Alley Cat Allies
				"Founded in 1990, Alley Cat Allies is dedicated to the protection and humane treatment of cats. Our mission is to end the killing of cats and lead the movement for their humane care.",

				# Arizona-Sonora Desert Museum
				"We are dedicated to the conservation of the Sonoran Desert. Our mission is to inspire people to live in harmony with the natural world by fostering love, appreciation, and understanding of the Sonoran Desert.",		 

				# Lindsay Wildlife Museum
				"LWM is a unique natural history and environmental education center where live, wild animals are just inches away. Visitors can listen to the cry of a red tailed hawk, go eye-to-eye with a gray fox and watch a bald eagle eat lunch.",

				# Virginia Living Musuem
				"As the first living museum east of the Mississippi, we combine the	elements of a native wildlife park, science museum, aquarium, botanical preserve and planetarium.",

				# Academy of Achievements
				"For more than 45 years, the Academy of Achievement has sparked the imagination of students across America and around the globe by bringing them into direct personal contact with the greatest thinkers and achievers of the age.",

				# ACE Scholarships
				"ACE Scholarships was founded in 2000 to provide scholarships to children from low-income families in grades K-12, and to advocate for more choice for parents.",

				# A Beka Foundation
				"The A Beka Foundation helps businesses, churches, and parents enroll into the A Beka programs.  You no longer have to make money a reason for not enrolling your child into ABA or ABB.",

				# A Place Called Home
				"We provide a safe, nurturing environment in South Central Los Angeles where underserved youth become the authors of their own lives and are inspired to make a meaningful difference in their community and the world.",

				# Acterra
				"Our long history of innovation and partnership enables us to draw on the wisdom and experience of two generations of environmental leaders.",

				# Wyman Center
				"Our vision is to foster communities where every teen is expected and supported to thrive in life, work and learning so that they may become economically self-sufficient, leaders in their communities and, ultimately, break the cycle of poverty.",

				# Action on Smoking and Health
				"ASH is a national legal-action antismoking and nonsmokers' rights organization which helped ban cigarette commercials, started the modern nonsmokers' rights movement, pioneered using legal action against smoking, and much more.",

				# Acumen Fund
				"We are a global venture fund that uses entrepreneurial approaches to solve the problems of global poverty.",

				# Alexander Graham Bell Association for the Deaf and Hard of Hearing
				"We help families, health care providers and education professionals understand childhood hearing loss and the importance of early diagnosis and intervention.",

				# Baptist Children's Home of NC
				"We provide residential placement and prevention services to help children and families overcome problems and challenges in 16 communities across the state",

				# Bread of Life Missions
				"We exist to overcome the cycle of homelessness in people's lives through a Christ-centered complete recovery model with God's help.",

				# Dare To Care Food Bank
				"Dare to Care Food Bank works to end hunger in our community through partnerships, innovative programs, and community engagement.",

				# All God's Children
				"AGC is dedicated to orphaned and disadvantaged children of Honduras. We helped build and create Hogar de Ninos Nazareth, a refuge of care and compassion, where the children were given food, shelter, medical care, spiritual training and love.",

				# HIAS
				"The Hebrew Immigrant Aid Society, has had an extraordinary impact on millions of Jews. For generation after generation, HIAS has provided essential lifesaving services to world Jewry, through its mission of rescue, reunion and resettlement.",

			 	# Matthew 25 ministries
			 	"Matthew 25 Ministries (M25M) is an international humanitarian relief organization helping the poorest of the poor locally, regionally, nationally and internationally regardless of race, creed or political persuasion.",

			 	# Be the Match Foundation
			 	"Be The Match Foundation was created to secure support for the work of the National Marrow Donor Program. Thousands of patients with leukemia and other life-threatening diseases depend on us to raise funds to support the work of the NMDP.",

			 	# advocates international
			 	"AI seeks to encourage and enable a global network of skilled advocates committed to religious liberty, human rights, conflict resolution, and professional ethics. AI is guided in its mission and methods by Christ's Good Samaritan parable.",

			 	# hands on atlanta
			 	"Founded in 1989, Hands On Atlanta is a non-profit organization that helps individuals, families and corporate and community groups find flexible volunteer opportunities at more than 500 community-based agencies and schools.",

			 	# African Bible Colleges Inc
			 	"The vision of African Bible College is to offer quality, education with a Christian emphasis to the people of East and Central Africa. The chief aim of African Bible College is to train Godly men and women for Christian leadership and service.",

			 	# Child Evangelism Fellowship
			 	"We are Bible-centered, worldwide organization composed of born-again believers whose purpose is to evangelize boys and girls with the Gospel of the Lord Jesus Christ and to establish (disciple) them in the local church for Christian living.",

			 	# Answers in Genesis
			 	"AiG is a Christianity-defending ministry, dedicated to enabling Christians to defend their faith, and to proclaim the gospel of Jesus Christ effectively.",

			 	# Youths for Christ
				"YFC is dedicated to helping teens live a godly, moral lifestyle. Though this is contrary to the world, YFC aims to emphasize the benefits of moral living while reaching the teens for Christ.",

			 	# Senioritis Coorporation
				"Are you a senior, graduating, or just wish your senior year was here already? Do you feel like doing no homework at all? Join the club (literally)! We have the cure!",

			 	# days end farm horse rescue
			 	"Days End Farm Horse Rescue (Days End) is a volunteer based, animal welfare organization established in 1989 to foster compassion and responsibility for horses through intervention, education and outreach.",

			 	# civil war trust
			 	"CWT has been America's largest non-profit organization devoted to preserving our nation's endangered Civil War battlefields. The Trust's 53,000 members and 155,000+ Facebook fans have helped save over 36,000 Acres of hallowed ground in 20 states.",

			 	# boston philharmonic orchestra
			 	"Our message rings loud and clear- music making is a privilege and a joy, and above all, a collaborative adventure."

				

							
 ein          = 12332345

# Select the charity categories
 categories   = CharityCategory.all

# Create the charities and link them to a user
   charities = Charity.create!([{ name: charityNames[0], 
   								 eid: ein, 
   								 description: descriptions[0],#"Our goal is to enrich the lives of people with disabilities by the training and placement of service dogs to provide individuals with companionship and promote independent living.",
   								 mission_statement: "Providing canine miracles for people with disabilities worldwide",
   								 target_area: "USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[0].id}, 

   							   { name: charityNames[1], 
   								 eid: ein+1, 
   								 description: descriptions[1],#"Founded in 1990, Alley Cat Allies is dedicated to the protection and humane treatment of cats. Our mission is to end the killing of cats and lead the movement for their humane care.",
   								 mission_statement: "Ensuring the wildlife and wild lands of Africa will endure forever",
   								 target_area: "Africa",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[0].id},

   							   { name: charityNames[2], 
   								 eid: ein+2, 
   								 description: descriptions[2],#"We are dedicated to the conservation of the Sonoran Desert. Our mission is to inspire people to live in harmony with the natural world by fostering love, appreciation, and understanding of the Sonoran Desert.",
   								 mission_statement: "The cats' leading advocate",
   								 target_area: "Maryland",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[0].id},

   							   { name: charityNames[3], 
   								 eid: ein+3, 
   								 description: descriptions[3],
   								 mission_statement:"Where the desert comes alive",
   								 target_area: "Arizona",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[1].id}, 

   							   { name: charityNames[4], 
   								 eid: ein+4, 
   								 description: descriptions[4],
   								 mission_statement: "Connecting people with wildlife to inspire responsibility and respect for the world we share",
   								 target_area:"California",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[1].id}, 

   							   { name: charityNames[5], 
   								 eid: ein+5, 
   								 description: descriptions[5],
   								 mission_statement: "",
   								 target_area:"",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[1].id },

   							   { name: charityNames[6], 
   								 eid: ein+6, 
   								 description: descriptions[6],
   								 mission_statement: "A museum of living history",
   								 target_area: "Washington DC",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[2].id},

   							   { name: charityNames[7], 
   								 eid: ein+7, 
   								 description: descriptions[7],
   								 mission_statement:"Every child deserves a great education",
   								 target_area: "Colorado",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[2].id}, 
   								 
   							   { name: charityNames[8], 
   								 eid: ein+8, 
   								 description: descriptions[8],
   								 mission_statement:"Quality education for the people",
   								 target_area: "The World",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[2].id},

   							   { name: charityNames[9], 
   								 eid: ein+9, 
   								 description: descriptions[9],
   								 mission_statement:"A positive environment where young people develop tools and are empowered to have successful, fulfilling lives",
   								 target_area: "USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[3].id}, 

   							   { name: charityNames[10], 
   								 eid: ein+10, 
   								 description: descriptions[10],
   								 mission_statement:"to bring people together to create local solutions that enhance the natural environment.",
   								 target_area: "USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[3].id },

   							   { name: charityNames[11], 
   								 eid: ein+11, 
   								 description: descriptions[11],
   								 mission_statement: "Real teens. Real life. Real results.",
   								 target_area:"Missouri",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[3].id},

   							   { name: charityNames[12], 
   								 eid: ein+12, 
   								 description: descriptions[12],
   								 mission_statement:"Everything for people concerned about smoking and nonsmokers' rights",
   								 target_area: "USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[4].id}, 

   							   { name: charityNames[13], 
   								 eid: ein+13, 
   								 description: descriptions[13],
   								 mission_statement: "Building transformative businesses to solve the problems of poverty",
   								 target_area:"The world",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[4].id}, 
   								 
   							   { name: charityNames[14], 
   								 eid: ein+14, 
   								 description: descriptions[14],
   								 mission_statement: "",
   								 target_area: "USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[4].id },

   							   { name: charityNames[15], 
   								 eid: ein+15, 
   								 description: descriptions[15],
   								 mission_statement:"Advocating Independence through Listening and Talking!",
   								 target_area:"USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[5].id},

   							   { name: charityNames[16], 
   								 eid: ein+16, 
   								 description: descriptions[16],
   								 mission_statement: "Helping hurting children . . . healing broken families",
   								 target_area: "North Carolina",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[5].id}, 
   								 
   							   { name: charityNames[17], 
   								 eid: ein+17, 
   								 description: descriptions[17],
   								 mission_statement: "Restoring dignity and hope",
   								 target_area: "Anywhere",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[5].id}, 

   							   { name: charityNames[18], 
   								 eid: ein+18, 
   								 description: descriptions[18],
   								 mission_statement: "Leading our community to feed the hungry and conquer the cycle of need",
   								 target_area: "Kentucky",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[6].id}, 

   							   { name: charityNames[19], 
   								 eid: ein+19, 
   								 description: descriptions[19],
   								 mission_statement: "Dedicated to the orphaned and disadvantaged children of Honduras",
   								 target_area: "Honduras",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[6].id },

   							   { name: charityNames[20], 
   								 eid: ein+20, 
   								 description: descriptions[20],
   								 mission_statement: "Rescue, reunion and resettlement",
   								 target_area: "",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[6].id},

   							   { name: charityNames[21], 
   								 eid: ein+21, 
   								 description: descriptions[21],
   								 mission_statement: "Caring for a needy world with the things we throw away",
   								 target_area: "worldwide",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[7].id}, 

   							   { name: charityNames[22], 
   								 eid: ein+22, 
   								 description: descriptions[22],
   								 mission_statement:"A legacy of support for the National Marrow Donor Program",
   								 target_area:"USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[7].id}, 
   								 
   							   { name: charityNames[23], 
   								 eid: ein+23, 
   								 description: descriptions[23],
   								 mission_statement: "Doing justice with compassion",
   								 target_area: "Nationwide",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[7].id },

   							   { name: charityNames[24], 
   								 eid: ein+24, 
   								 description: descriptions[24],
   								 mission_statement: "Do something good",
   								 target_area: "Atlanta",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[8].id},

   							   { name: charityNames[25], 
   								 eid: ein+25, 
   								 description: descriptions[25],
   								 mission_statement:"To Train Godly Men and Women",
   								 target_area:"East and Central Africa",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[8].id}, 
   								 
   							   { name: charityNames[26], 
   								 eid: ein+26, 
   								 description: descriptions[26],
   								 mission_statement:"Reaching children worldwide",
   								 target_area:"worldwide",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[8].id}, 

   							   { name: charityNames[27], 
   								 eid: ein+27, 
   								 description: descriptions[27],
   								 mission_statement:"Believing it. Defending it. Proclaiming it.",
   								 target_area:"worldwide",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[8].id},

   							   { name: charityNames[28], 
   								 eid: ein+28, 
   								 description: descriptions[28],
   								 mission_statement:"Helping seniors everywhere",
   								 target_area: "PCC",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[9].id}, 
   								 
   							   { name: charityNames[29], 
   								 eid: ein+29, 
   								 description: descriptions[29],
   								 mission_statement:"Ensuring quality care and treatment of horses through intervention, education, and outreach",
   								 target_area:"USA",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[9].id},

   							   { name: charityNames[30], 
   								 eid: ein+30, 
   								 description: descriptions[30],
   								 mission_statement:"Saving America's Civil War Battlefields",
   								 target_area:"",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[9].id},

   							   { name: charityNames[31], 
   								 eid: ein+31, 
   								 description: descriptions[31],
   								 mission_statement:"Passionate music making without boundaries",
   								 target_area:"",
   								 video_url: "", video_url_html: "", cover_photo: nil,
   								 category_id: categories[9].id}
    								 ])

# Link users with charities
Charity.all.each do |c|
	User.create!(email: charityEmail[c.id-1], 
				password: password, 
				rolable_id: c.id, 
				rolable_type: "Charity", 
				phone: "",
				is_available:1)
end

# This charity is for Bearing Precious Seed. Only we can log into it.

bps = Charity.create!(name: "Bearing Precious Seed",
					  eid: ein+32,
					  description:"",
					  mission_statement: "Providing thousands of Bibles worldwide",
					  target_area: "The world",
					  category_id: categories[8].id,
					  video_url: "", video_url_html: "", cover_photo: nil)

User.create!(email: "bearingpreciousseed@evangelize.org",
			 password: password,
			 rolable_id: bps.id,
			 rolable_type: "Charity",
			 phone:"",
			 is_available:2)
charityNames.count.times do |c|
	charity  = Charity.create(name: charityNames[c], eid: ++ein, description:description, 
							  video_url: "", video_url_html: "", mission_statement: "", 
							  cover_photo: nil, target_area: "", 
							  category_id: Random.rand(categories[0].id..categories.count))
	user     = User.create(email: charityEmail[c], 
						   password: password, 
						   rolable_id: charity.id, 
						   rolable_type: "Charity", 
						   phone: "",
						   is_available:1)
end

###################################################################################
#						Populate the database with businesses 					  #
###################################################################################
businessNames = ["Walmart","Target","Sam's Fun City", "Olive Garden", 
				  "Pensacola Christian College", "Pensacola State College", 
				  "Chains R Us", "Sports Authority"]
businessEmail = ["ceo@walmart.com", "nomorescams@target.org", "comeandplay@sfc.org", 
				 "italian@olivegarden.org","pcc@groupgrant.org","psc@groupgrant.org",
				 "chainsrus@groupgrant.org", "sports@groupgrant.org"]

# Select the business categories				 
categories = BusinessCategory.all

# Create the businesses  
  businesses = Business.create!([
  								{ name: 'Petco',
  								  description: "caring for pets everywhere",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id:  BusinessCategory.find_by_name("Animals").id
  								  }, 

  								{ name: 'Petsmart',
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Animals").id
  								  }, 

  								{ name: "32 Degrees Yogurt Bar",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id:BusinessCategory.find_by_name("Food Services").id
  								  }, 

  								{ name: "A Flower Shop",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id:BusinessCategory.find_by_name("Environment").id
  								  }, 

  								{ name: "Ambassador Cleaners",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Public Benefit").id}, 

  								{ name: 'Baptist Hospital',
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Health").id
  								  }, 

  								{ name: "Southern Capital Services (Investment)",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Other").id
  								  }, 

  								{ name: "State Farm Insurance",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Health").id
  								  }, 

  								{ name: "Vitamin Shoppe",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Health").id
  								  }, 

  								{ name: "Wal-Mart",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Food Services").id
  								  }, 
  								  
  								{ name: "Wells Fargo Bank",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Finance").id
  								  }, 

  								{ name: "Wade Air Conditioning",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id:BusinessCategory.find_by_name("Other").id
  								  }, 

  								{ name: "Affiliated Insurance",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Human Services").id
  								  }, 

  								{ name: "Robinson Life Insurance",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Human Services").id
  								  }, 

  								{ name: "Oh Snap Cupcakes",
  								  description: "",
  								  location:"",
  								  goods: "", services:"Cupcakes", interests:"",
  								  category_id: BusinessCategory.find_by_name("Food Services").id
  								  }, 

  								{ name: "Opti-Club",
  								  description: "",
  								  location:"",
  								  goods: "", services:"glasses", interests:"",
  								  category_id: BusinessCategory.find_by_name("Other").id
  								  }, 
  								  
  								{ name: "Pensacola Christian College", 
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id:BusinessCategory.find_by_name("Education").id
  								  }, 

  								{ name: "Pensacola International Airport",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id:BusinessCategory.find_by_name("Other").id
  								  }, 

  								{ name: "Pensacola Ice Flyers",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Entertainment").id
  								  }, 

  								{ name: "Walt Disney World",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Entertainment").id
  								  }, 

  								{ name: "Chuck E. Cheese",
  								  description: "",
  								  location:"",
  								  goods: "", services:"", interests:"",
  								  category_id: BusinessCategory.find_by_name("Entertainment").id
  								}

  								])

# I decided to automatically generate an email based on the name
Business.all.each do |b|
	email = b.name.split[0] + Random.rand(00..40).to_s + "@groupgrant.org"
	User.create!(email: email,     password: password,
				 rolable_id: b.id, rolable_type: "Business",
				 phone: Random.rand(3360394323...8500348300),
				 is_available: 1)
end
businessNames.count.times do |b|
	business  = Business.create(name: businessNames[b], goods: "", services: "", 
							    description: description, location: "",
							    category_id: Random.rand(categories[0].id..categories.count), 
							    interests: "")
	user      = User.create(email: businessEmail[b], password: password, 
							rolable_id: business.id,  rolable_type: "Business",
							phone: "",
							is_available:1)					         
end

###################################################################################
#						  Populate the database with donors 					  #
###################################################################################
# Donors
first      = ["John", "Jim", "Bob", "Joe", "Stephen", "Joshua", "Gordon", "Chris", 
		      "Michael", "Rob", "Zorro", "Michael", "Jared", "Ben", "Bethany", "Stephanie",
			  "Ashley", "Tricia"]
last       =  "Smith" , "Johnson"
toggle = false
first.count.times do |d|
	donor = Donor.create(title: "Mr.", first_name: first[d], 
						 last_name: toggle ? last[0] : last[1], middle_initial:"")
	user  = User.create(email: donor.first_name + Random.rand(00..40).to_s + "@groupgrant.org",
						password: password, 
					    rolable_id: donor.id, rolable_type: "Donor", 
					    phone: Random.rand(2360394323...9500348300),
					    is_available:1)
	toggle = toggle ? false : true
end

# ###################################################################################
# #						Populate the database with groupgrants 					  #
# ###################################################################################
# groupgrant_categories = ["Products", "Children","Construction", "Food", 
# 						 "Education", "Clothing", "Animals", "Disabled", 
# 						 "Finance", "Environment", "Missions", "Other"]
# name = "This is a test"
# #groupgrant_description = "Feel free to edit it"
# date = "2014-04-07"

# # Create all categories
# groupgrant_categories.count.times do |c|
# 	categories = GroupgrantCategory.create(name: groupgrant_categories[c])
# end

# # Create the groupgrants
# categories   = GroupgrantCategory.all # Select all categories
# User.where(rolable_type: "Charity").each do |c|
# 	groupgrant = Groupgrant.create(name: name, owner_id: c.id, partner_id: 0,
# 								   description: description,
# 								   goal_date: date, goal_amount: 
# 								   		Random.rand(1000..1000000),
# 								   video_url: "", 
# 								   category_id: 
# 								   		Random.rand(categories[0].id..categories.count))
# end

# Spree::Core::Engine.load_seed if defined?(Spree::Core)
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
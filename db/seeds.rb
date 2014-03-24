def rand_eid 
   rand(999999999).to_s.center(9, rand(9).to_s)
end

def rand_phone
   rand(9999999999).to_s.center(10, rand(9).to_s)
end


charity_categories = ["Animals", "Arts and Culture", "Education", "Environment", "Health", "Human Services", "International", "Public Benefit", "Religion", "Other"]
charity_categories.each do |category| CharityCategory.create(name: category) end   
charity_categories = CharityCategory.all

business_categories = ["Animals", "Education", "Food Services", "Environment", "Health", "Human Services", "Public Benefit", "Finance", "Other", "Entertainment" ]   
business_categories.each do |business| BusinessCategory.create(name: business) end
business_categories = BusinessCategory.all


###################################################################################
#                 Populate the database with charities                #
###################################################################################
charities = []
charity_emails = []
   charities << {name: "4 Paws for Ability", eid: rand_eid, description: "Our goal is to enrich the lives of people with disabilities by the training and placement of service dogs to provide individuals with companionship and promote independent living;", #"Our goal is to enrich the lives of people with disabilities by the training and placement of service dogs to provide individuals with companionship and promote independent living.",
   mission_statement: "Providing canine miracles for people with disabilities worldwide", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "4Paws@groupgrant.com"

   charities << {name: "African Wildlife Foundation", eid: rand_eid, description: "Founded in 1961, the African Wildlife Foundation (AWF), together with the people of Africa, works to ensure the wildlife and wild lands of Africa will endure forever.", #"Founded in 1990, Alley Cat Allies is dedicated to the protection and humane treatment of cats. Our mission is to end the killing of cats and lead the movement for their humane care.",
   mission_statement: "Ensuring the wildlife and wild lands of Africa will endure forever", target_area: "Africa", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "AfricanWildlife@groupgrant.com"

   charities << {name: "Alley Cat Allies", eid: rand_eid, description: "Founded in 1990, Alley Cat Allies is dedicated to the protection and humane treatment of cats. Our mission is to end the killing of cats and lead the movement for their humane care.", #"We are dedicated to the conservation of the Sonoran Desert. Our mission is to inspire people to live in harmony with the natural world by fostering love, appreciation, and understanding of the Sonoran Desert.",
   mission_statement: "The cats' leading advocate", target_area: "Maryland", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "AlleyCat@groupgrant.com"

   charities << {name: "Arizona-Sonora Desert Museum", eid: rand_eid, description: "We are dedicated to the conservation of the Sonoran Desert. Our mission is to inspire people to live in harmony with the natural world by fostering love, appreciation, and understanding of the Sonoran Desert.",      
   mission_statement:"Where the desert comes alive", target_area: "Arizona", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Arts and Culture").id}
   charity_emails << "Arizon@groupgrant.com"

   charities << {name: "Lindsay Wildlife Museum", eid: rand_eid, description: "LWM is a unique natural history and environmental education center where live, wild animals are just inches away. Visitors can listen to the cry of a red tailed hawk, go eye-to-eye with a gray fox and watch a bald eagle eat lunch.",
   mission_statement: "Connecting people with wildlife to inspire responsibility and respect for the world we share", target_area:"California", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Arts and Culture").id}
   charity_emails << "LindsayWildlife@groupgrant.com"

   charities << {name: "Virginia Living Musuem", eid: rand_eid, description: "As the first living museum east of the Mississippi, we combine the  elements of a native wildlife park, science museum, aquarium, botanical preserve and planetarium.",
   mission_statement: "", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Arts and Culture").id}
   charity_emails << "VirginiaLiving@groupgrant.com"

   charities << {name: "Academy of Achievements", eid: rand_eid, description: "For more than 45 years, the Academy of Achievement has sparked the imagination of students across America and around the globe by bringing them into direct personal contact with the greatest thinkers and achievers of the age.",
   mission_statement: "A museum of living history", target_area: "Washington DC", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Education").id}
   charity_emails << "Academyof@groupgrant.com"

   charities << {name: "ACE Scholarships", eid: rand_eid, description: "ACE Scholarships was founded in 2000 to provide scholarships to children from low-income families in grades K-12, and to advocate for more choice for parents.",
   mission_statement:"Every child deserves a great education", target_area: "Colorado", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Education").id}
   charity_emails << "ACEScholarships@groupgrant.com"

   charities << {name: "A Beka Foundation", eid: rand_eid, description: "The A Beka Foundation helps businesses, churches, and parents enroll into the A Beka programs.  You no longer have to make money a reason for not enrolling your child into ABA or ABB.",
   mission_statement:"Quality education for the people", target_area: "The World", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Education").id}
   charity_emails << "ABeka@groupgrant.com"

   charities << {name: "A Place Called Home", eid: rand_eid, description: "We provide a safe, nurturing environment in South Central Los Angeles where underserved youth become the authors of their own lives and are inspired to make a meaningful difference in their community and the world.",
   mission_statement:"A positive environment where young people develop tools and are empowered to have successful, fulfilling lives", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Environment").id}
   charity_emails << "APlace@groupgrant.com"

   charities << {name: "Acterra", eid: rand_eid, description: "Our long history of innovation and partnership enables us to draw on the wisdom and experience of two generations of environmental leaders.",
   mission_statement:"to bring people together to create local solutions that enhance the natural environment.", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Environment").id}
   charity_emails << "Acterr@groupgrant.com"

   charities << {name: "Wyman Center", eid: rand_eid, description: "Our vision is to foster communities where every teen is expected and supported to thrive in life, work and learning so that they may become economically self-sufficient, leaders in their communities and, ultimately, break the cycle of poverty.",
   mission_statement: "Real teens. Real life. Real results.", target_area:"Missouri", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Health").id}
   charity_emails << "WymanCenter@groupgrant.com"

   charities << {name: "Action on Smoking and Health", eid: rand_eid, description: "ASH is a national legal-action antismoking and nonsmokers' rights organization which helped ban cigarette commercials, started the modern nonsmokers' rights movement, pioneered using legal action against smoking, and much more.",
   mission_statement:"Everything for people concerned about smoking and nonsmokers' rights", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Health").id}
   charity_emails << "Actionon@groupgrant.com"

   charities << {name: "Acumen Fund", eid: rand_eid, description: "We are a global venture fund that uses entrepreneurial approaches to solve the problems of global poverty.",
   mission_statement: "Building transformative businesses to solve the problems of poverty", target_area:"The world", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "AcumenFund@groupgrant.com"

   charities << {name: "Alexander Graham Bell Association for the Deaf and Hard of Hearing", eid: rand_eid, description: "We help families, health care providers and education professionals understand childhood hearing loss and the importance of early diagnosis and intervention.",
   mission_statement: "", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "AlexanderGraham@groupgrant.com"

   charities << {name: "Baptist Children's Home of NC", eid: rand_eid, description: "We provide residential placement and prevention services to help children and families overcome problems and challenges in 16 communities across the state",
   mission_statement:"Advocating Independence through Listening and Talking!", target_area:"USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "BaptistChildren@groupgrant.com"

   charities << {name: "Bread of Life Missions", eid: rand_eid, description: "We exist to overcome the cycle of homelessness in people's lives through a Christ-centered complete recovery model with God's help.",
   mission_statement: "Helping hurting children . . . healing broken families", target_area: "North Carolina", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("International").id}
   charity_emails << "Breadof@groupgrant.com"

   charities << {name: "Dare To Care Food Bank", eid: rand_eid, description: "Dare to Care Food Bank works to end hunger in our community through partnerships, innovative programs, and community engagement.",
   mission_statement: "Restoring dignity and hope", target_area: "Anywhere", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "DareTo@groupgrant.com"

   charities << {name: "All God's Children", eid: rand_eid, description: "AGC is dedicated to orphaned and disadvantaged children of Honduras. We helped build and create Hogar de Ninos Nazareth, a refuge of care and compassion, where the children were given food, shelter, medical care, spiritual training and love.",
   mission_statement: "Leading our community to feed the hungry and conquer the cycle of need", target_area: "Kentucky", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "AllGod@groupgrant.com"

   charities << {name: "HIAS", eid: rand_eid, description: "The Hebrew Immigrant Aid Society, has had an extraordinary impact on millions of Jews. For generation after generation, HIAS has provided essential lifesaving services to world Jewry, through its mission of rescue, reunion and resettlement.",
   mission_statement: "Dedicated to the orphaned and disadvantaged children of Honduras", target_area: "Honduras", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "HIA@groupgrant.com"

   charities << {name: "Matthew 25 ministries", eid: rand_eid, description: "Matthew 25 Ministries (M25M) is an international humanitarian relief organization helping the poorest of the poor locally, regionally, nationally and internationally regardless of race, creed or political persuasion.",
   mission_statement: "Rescue, reunion and resettlement", target_area: "", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "Matthew25@groupgrant.com"

   charities << {name: "Be the Match Foundation", eid: rand_eid, description: "Be The Match Foundation was created to secure support for the work of the National Marrow Donor Program. Thousands of patients with leukemia and other life-threatening diseases depend on us to raise funds to support the work of the NMDP.",
   mission_statement: "Caring for a needy world with the things we throw away", target_area: "worldwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "Bethe@groupgrant.com"

   charities << {name: "Advocates International", eid: rand_eid, description: "AI seeks to encourage and enable a global network of skilled advocates committed to religious liberty, human rights, conflict resolution, and professional ethics. AI is guided in its mission and methods by Christ's Good Samaritan parable.",
   mission_statement:"A legacy of support for the National Marrow Donor Program", target_area:"USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Public Benefit").id}
   charity_emails << "AdvocatesInternational@groupgrant.com"

   charities << {name: "Hands On Atlanta", eid: rand_eid, description: "Founded in 1989, Hands On Atlanta is a non-profit organization that helps individuals, families and corporate and community groups find flexible volunteer opportunities at more than 500 community-based agencies and schools.",
   mission_statement: "Doing justice with compassion", target_area: "Nationwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "HandsOn@groupgrant.com"

   charities << {name: "Africa Bible Colleges Inc.", eid: rand_eid, description: "The vision of African Bible College is to offer quality, education with a Christian emphasis to the people of East and Central Africa. The chief aim of African Bible College is to train Godly men and women for Christian leadership and service.",
   mission_statement: "Do something good", target_area: "Atlanta", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "AfricaBible@groupgrant.com"

   charities << {name: "Child Evangelism Fellowship", eid: rand_eid, description: "We are Bible-centered, worldwide organization composed of born-again believers whose purpose is to evangelize boys and girls with the Gospel of the Lord Jesus Christ and to establish (disciple) them in the local church for Christian living.",
   mission_statement:"To Train Godly Men and Women", target_area:"East and Central Africa", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "ChildEvangelism@groupgrant.com"

   charities << {name: "Answers In Genesis", eid: rand_eid, description: "AiG is a Christianity-defending ministry, dedicated to enabling Christians to defend their faith, and to proclaim the gospel of Jesus Christ effectively.",
   mission_statement:"Reaching children worldwide", target_area:"worldwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "AnswersIn@groupgrant.com"

   charities << {name: "Youths for Christ", eid: rand_eid, description: "YFC is dedicated to helping teens live a godly, moral lifestyle. Though this is contrary to the world, YFC aims to emphasize the benefits of moral living while reaching the teens for Christ.",
   mission_statement:"Believing it. Defending it. Proclaiming it.", target_area:"worldwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "Youthsfor@groupgrant.com"

   charities << {name: "Senioritis Coorporation", eid: rand_eid, description: "Are you a senior, graduating, or just wish your senior year was here already? Do you feel like doing no homework at all? Join the club (literally)! We have the cure!",
   mission_statement:"Helping seniors everywhere", target_area: "PCC", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "SenioritisCoorporation@groupgrant.com"

   charities << {name: "Days End Farm horse Rescue", eid: rand_eid, description: "Days End Farm Horse Rescue (Days End) is a volunteer based, animal welfare organization established in 1989 to foster compassion and responsibility for horses through intervention, education and outreach.",
   mission_statement:"Ensuring quality care and treatment of horses through intervention, education, and outreach", target_area:"USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "DaysEnd@groupgrant.com"

   charities << {name: "Civil War Trust", eid: rand_eid, description: "CWT has been America's largest non-profit organization devoted to preserving our nation's endangered Civil War battlefields. The Trust's 53,000 members and 155,000+ Facebook fans have helped save over 36,000 Acres of hallowed ground in 20 states.",
   mission_statement:"Saving America's Civil War Battlefields", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Other").id}
   charity_emails << "CivilWar@groupgrant.com"

   charities << {name: "Boston Philharmonic Orchestra", eid: rand_eid, description: "Our message rings loud and clear- music making is a privilege and a joy, and above all, a collaborative adventure.",
   mission_statement:"Passionate music making without boundaries", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Other").id}
   charity_emails << "BostonPhilharmonic@groupgrant.com"

password = "groupgrant"

charities.each_with_index do |charity, index|
   new_charity = Charity.create!(charity)
   User.create!(email: charity_emails[index], password: password, rolable_id: new_charity.id, rolable_type: "Charity", phone: rand_phone, is_available:1)
end

charities = Charity.all



###################################################################################
#                 Populate the database with businesses                #
###################################################################################

businesses = []
business_emails = []
   businesses << { name: 'Petco', description: "caring for pets everywhere", location:"", goods: "", services:"", interests:"", 
     category_id:  BusinessCategory.find_by_name("Animals").id}
   business_emails << "Petco@groupgrant.com"

   businesses << { name: 'Petsmart', description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Animals").id}
   business_emails << "Petsmart@groupgrant.com"

   businesses << { name: "32 Degrees Yogurt Bar", description: "", location:"", goods: "", services:"", interests:"", 
     category_id:BusinessCategory.find_by_name("Food Services").id}
   business_emails << "32Degrees@groupgrant.com"

   businesses << { name: "A Flower Shop", description: "", location:"", goods: "", services:"", interests:"", 
     category_id:BusinessCategory.find_by_name("Environment").id}
   business_emails << "AFlower@groupgrant.com"

   businesses << { name: "Ambassador Cleaners", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Public Benefit").id}
   business_emails << "Ambassador@groupgrant.com"

   businesses << { name: 'Baptist Hospital', description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Health").id}
   business_emails << "Baptist@groupgrant.com"

   businesses << { name: "Southern Capital Services (Investment)", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Other").id}
   business_emails << "Southern@groupgrant.com"

   businesses << { name: "State Farm Insurance", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Health").id}
   business_emails << "State@groupgrant.com"

   businesses << { name: "Vitamin Shoppe", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Health").id}
   business_emails << "Vitamin@groupgrant.com"

   businesses << { name: "Wal-Mart", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Food Services").id}
   business_emails << "Wal@groupgrant.com"

   businesses << { name: "Wells Fargo Bank", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Finance").id}
   business_emails << "Wells@groupgrant.com"

   businesses << { name: "Wade Air Conditioning", description: "", location:"", goods: "", services:"", interests:"", 
     category_id:BusinessCategory.find_by_name("Other").id}
   business_emails << "Wade@groupgrant.com"

   businesses << { name: "Affiliated Insurance", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Human Services").id}
   business_emails << "Affiliated@groupgrant.com"

   businesses << { name: "Robinson Life Insurance", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Human Services").id}
   business_emails << "Robinson@groupgrant.com"

   businesses << { name: "Oh Snap Cupcakes", description: "", location:"", goods: "", services:"Cupcakes", interests:"", 
     category_id: BusinessCategory.find_by_name("Food Services").id}
   business_emails << "OhSnap@groupgrant.com"

   businesses << { name: "Opti-Club", description: "", location:"", goods: "", services:"glasses", interests:"", 
     category_id: BusinessCategory.find_by_name("Other").id}
   business_emails << "Opti@groupgrant.com"

   businesses << { name: "Pensacola Christian College",  description: "", location:"", goods: "", services:"", interests:"", 
     category_id:BusinessCategory.find_by_name("Education").id}
   business_emails << "PensacolaChristian@groupgrant.com"

   businesses << { name: "Pensacola International Airport", description: "", location:"", goods: "", services:"", interests:"", 
     category_id:BusinessCategory.find_by_name("Other").id}
   business_emails << "PensacolaInternational@groupgrant.com"

   businesses << { name: "Pensacola Ice Flyers", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Entertainment").id}
   business_emails << "PensacolaIce@groupgrant.com"

   businesses << { name: "Walt Disney World", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Entertainment").id}
   business_emails << "Walt@groupgrant.com"

   businesses << { name: "Chuck E. Cheese", description: "", location:"", goods: "", services:"", interests:"", 
     category_id: BusinessCategory.find_by_name("Entertainment").id}
   business_emails << "ChuckE@groupgrant.com"

businesses.each_with_index do |business, index| 
   new_business = Business.create!(business)
   User.create!(email: business_emails[index], password: password, rolable_id: new_business.id, rolable_type: "Business", phone: rand_phone, is_available:1)
end

businesses = Business.all



###################################################################################
#                 Populate the database with donors                #
###################################################################################
donors = []
donors_emails = []
   donors << { title: "Mr",first_name: "Jacob", last_name: "Smith"}
   donors_emails << "JacobSmith@groupgrant.com"

   donors << { title: "Mr",first_name: "Mason", last_name: "Johnson"}
   donors_emails << "MasonJohnson@groupgrant.com"

   donors << { title: "Mr",first_name: "Ethan", last_name: "Williams"}
   donors_emails << "EthanWilliams@groupgrant.com"

   donors << { title: "Mr",first_name: "Noah", last_name: "Jones"}
   donors_emails << "NoahJones@groupgrant.com"

   donors << { title: "Mr",first_name: "William", last_name: "Brown"}
   donors_emails << "WilliamBrown@groupgrant.com"

   donors << { title: "Mr",first_name: "Liam", last_name: "Davis"}
   donors_emails << "LiamDavis@groupgrant.com"

   donors << { title: "Mr",first_name: "Jayden", last_name: "Miller"}
   donors_emails << "JaydenMiller@groupgrant.com"

   donors << { title: "Mr",first_name: "Michael", last_name: "Wilson"}
   donors_emails << "MichaelWilson@groupgrant.com"

   donors << { title: "Mr",first_name: "Alexander", last_name: "Moore"}
   donors_emails << "AlexanderMoore@groupgrant.com"

   donors << { title: "Mr",first_name: "Aiden", last_name: "Taylor"}
   donors_emails << "AidenTaylor@groupgrant.com"

   donors << { title: "Mr",first_name: "Daniel", last_name: "Anderson"}
   donors_emails << "DanielAnderson@groupgrant.com"

   donors << { title: "Mr",first_name: "Matthew", last_name: "Thomas"}
   donors_emails << "MatthewThomas@groupgrant.com"

   donors << { title: "Mr",first_name: "Elijah", last_name: "Jackson"}
   donors_emails << "ElijahJackson@groupgrant.com"

   donors << { title: "Mr",first_name: "James", last_name: "White"}
   donors_emails << "JamesWhite@groupgrant.com"

   donors << { title: "Mr",first_name: "Anthony", last_name: "Harris"}
   donors_emails << "AnthonyHarris@groupgrant.com"

   donors << { title: "Mr",first_name: "Benjamin", last_name: "Martin"}
   donors_emails << "BenjaminMartin@groupgrant.com"

   donors << { title: "Mr",first_name: "Joshua", last_name: "Thompson"}
   donors_emails << "JoshuaThompson@groupgrant.com"

   donors << { title: "Mr",first_name: "Andrew", last_name: "Garcia"}
   donors_emails << "AndrewGarcia@groupgrant.com"

   donors << { title: "Mr",first_name: "David", last_name: "Martinez"}
   donors_emails << "DavidMartinez@groupgrant.com"

   donors << { title: "Mr",first_name: "Joseph", last_name: "Robinson"}
   donors_emails << "JosephRobinson@groupgrant.com"

   donors << { title: "Miss",first_name: "Sophia", last_name: "Clark"}
   donors_emails << "SophiaClark@groupgrant.com"

   donors << { title: "Miss",first_name: "Emma", last_name: "Rodriguez"}
   donors_emails << "EmmaRodriguez@groupgrant.com"

   donors << { title: "Miss",first_name: "Isabella", last_name: "Lewis"}
   donors_emails << "IsabellaLewis@groupgrant.com"

   donors << { title: "Miss",first_name: "Olivia", last_name: "Lee"}
   donors_emails << "OliviaLee@groupgrant.com"

   donors << { title: "Miss",first_name: "Ava", last_name: "Walker"}
   donors_emails << "AvaWalker@groupgrant.com"

   donors << { title: "Miss",first_name: "Emily", last_name: "Hall"}
   donors_emails << "EmilyHall@groupgrant.com"

   donors << { title: "Miss",first_name: "Abigail", last_name: "Allen"}
   donors_emails << "AbigailAllen@groupgrant.com"

   donors << { title: "Miss",first_name: "Mia", last_name: "Young"}
   donors_emails << "MiaYoung@groupgrant.com"

   donors << { title: "Miss",first_name: "Madison", last_name: "Hernandez"}
   donors_emails << "MadisonHernandez@groupgrant.com"

   donors << { title: "Miss",first_name: "Elizabeth", last_name: "King"}
   donors_emails << "ElizabethKing@groupgrant.com"

   donors << { title: "Miss",first_name: "Chloe", last_name: "Wright"}
   donors_emails << "ChloeWright@groupgrant.com"

   donors << { title: "Miss",first_name: "Ella", last_name: "Lopez"}
   donors_emails << "EllaLopez@groupgrant.com"

   donors << { title: "Miss",first_name: "Avery", last_name: "Hill"}
   donors_emails << "AveryHill@groupgrant.com"

   donors << { title: "Miss",first_name: "Addison", last_name: "Scott"}
   donors_emails << "AddisonScott@groupgrant.com"

   donors << { title: "Miss",first_name: "Aubrey", last_name: "Green"}
   donors_emails << "AubreyGreen@groupgrant.com"

   donors << { title: "Miss",first_name: "Lily", last_name: "Adams"}
   donors_emails << "LilyAdams@groupgrant.com"

   donors << { title: "Miss",first_name: "Natalie", last_name: "Baker"}
   donors_emails << "NatalieBaker@groupgrant.com"

   donors << { title: "Miss",first_name: "Sofia", last_name: "Gonzalez"}
   donors_emails << "SofiaGonzalez@groupgrant.com"

   donors << { title: "Miss",first_name: "Charlotte", last_name: "Nelson"}
   donors_emails << "CharlotteNelson@groupgrant.com"

   donors << { title: "Miss",first_name: "Zoey", last_name: "Carter"}
   donors_emails << "ZoeyCarter@groupgrant.com"

donors.each_with_index do |donor, index| 
   new_donor = Donor.create!(donor)
   User.create!(email: donors_emails[index], password: password, rolable_id: new_donor.id, rolable_type: "Donor", phone: rand_phone, is_available:1)
end

donors = Donor.all


#################################################################################
#############################  SET UP SPREE  ####################################
#################################################################################

new_donor = Donor.create!({ title: "Mr",first_name: "Stephen", last_name: "Weaver"})
User.create!(email: "sjwsgm@gmail.com", password: "password", rolable_id: new_donor.id, rolable_type: "Donor", phone: rand_phone, is_available:3)
user = User.find_by(email: "sjwsgm@gmail.com")
user.spree_roles << Spree::Role.find_or_create_by(name: "admin")

class User < ActiveRecord::Base
  preference :hot_salsa, :boolean
  preference :dark_chocolate, :boolean, :default => true
  preference :color, :string
  preference :favorite_number, :integer
  preference :language, :string, :default => "English"
end

Spree::Gateway::StripeGateway.create!(
   name: "Stripe",
   description: "stripe",
   active: true,
   environment: Rails.env,
   display_on: '',
   preferred_secret_key: 'sk_test_lI4B1u5NPxXesSLYuOnL2u72',
   preferred_server: 'test',
   preferred_test_mode: true,
   preferred_publishable_key: 'pk_test_IIvnJ7YTt0yZk0uKrRN5f4Ss')
 
spree_product_categories = ["Animals", "Arts and Culture", "Education", "Environment", "Health", "Human Services", "International", "Public Benefit", "Religion", "Other"]
spree_product_categories.each do |category| Spree::Taxonomy.create(name: category) end   

shipping_cat = Spree::ShippingCategory.create!(
   name: 'Default Shipping'
)

tax_cat = Spree::TaxCategory.create!(
   name: 'Default Tax',
   description: "Just default"
)


products = [{
   name: "first Product",
   price: 50,
   description: "description goes here",
   tax_category: tax_cat,
   meta_keywords: "this is meta",
   meta_description: "this is meta descripiton",
   shipping_category: shipping_cat,
   available_on: 3.days.ago
}]

products.each do |product_attrs|
   product = Spree::Product.create!(product_attrs)
   # product.taxons << Spree::Taxonomy.find_or_create_by(name: "Animals")
   product.images.create(:attachment => File.open(File.join(Rails.root, "db", "seeds", "images", "image1.jpg")))
   product.save
end


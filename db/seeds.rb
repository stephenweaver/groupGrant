def rand_eid 
   rand(999999999).to_s.center(9, rand(9).to_s)
end

def rand_phone
   rand(9999999999).to_s.center(10, rand(9).to_s).to_s
end

def rand_goal_amount 
   1000 + rand(24000)
end

def rand_percentage 
   rand(50) / 100.0
end

charity_categories = ["Animals", "Arts and Culture", "Education", "Environment", "Health", "Human Services", "International", "Public Benefit", "Religion", "Other"]
charity_categories.each do |category| CharityCategory.create(name: category) end   
charity_categories = CharityCategory.all

business_categories = ["Animals", "Education", "Food Services", "Environment", "Health", "Human Services", "Public Benefit", "Finance", "Other", "Entertainment" ]   
business_categories.each do |category| BusinessCategory.create(name: category) end
business_categories = BusinessCategory.all


groupgrant_categories = ["Products", "Children","Construction", "Food", "Education", "Clothing", "Animals", "Disabled", "Finance", "Environment", "Missions", "Other"]
groupgrant_categories.each do |category| GroupgrantCategory.create(name: category) end
groupgrant_categories = GroupgrantCategory.all

Spree::Config[:track_inventory_levels] = false
###################################################################################
#                 Populate the database with charities                            #
###################################################################################
charities = []
charity_emails = []
   # Charity info taken from http://www.bpsmilford.org
   charities << {image: "pic33", name: "Bearing Precious Seed", eid: rand_eid, description: "Bearing Precious Seed is a Scripture publishing ministry of First Baptist Church in Milford, Ohio. Since 1973, BPS has printed over 132 million Scriptures and Scripture portions and distributed them to churches and missionaries all around the world.",
   mission_statement:"Partnering with missionaries in reaching people for Christ.", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "BearingPreciousSeed@groupgrant.com"

   charities << {image: "pic1", name: "4 Paws for Ability", eid: rand_eid, description: "Our goal is to enrich the lives of people with disabilities by the training and placement of service dogs to provide individuals with companionship and promote independent living;", #"Our goal is to enrich the lives of people with disabilities by the training and placement of service dogs to provide individuals with companionship and promote independent living.",
   mission_statement: "Providing canine miracles for people with disabilities worldwide", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "4Paws@groupgrant.com"

   charities << {image: "pic2", name: "African Wildlife Foundation", eid: rand_eid, description: "Founded in 1961, the African Wildlife Foundation (AWF), together with the people of Africa, works to ensure the wildlife and wild lands of Africa will endure forever.", #"Founded in 1990, Alley Cat Allies is dedicated to the protection and humane treatment of cats. Our mission is to end the killing of cats and lead the movement for their humane care.",
   mission_statement: "Ensuring the wildlife and wild lands of Africa will endure forever", target_area: "Africa", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "AfricanWildlife@groupgrant.com"

   charities << {image: "pic3", name: "Alley Cat Allies", eid: rand_eid, description: "Founded in 1990, Alley Cat Allies is dedicated to the protection and humane treatment of cats. Our mission is to end the killing of cats and lead the movement for their humane care.", #"We are dedicated to the conservation of the Sonoran Desert. Our mission is to inspire people to live in harmony with the natural world by fostering love, appreciation, and understanding of the Sonoran Desert.",
   mission_statement: "The cats' leading advocate", target_area: "Maryland", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "AlleyCat@groupgrant.com"

   charities << {image: "pic4", name: "Arizona-Sonora Desert Museum", eid: rand_eid, description: "We are dedicated to the conservation of the Sonoran Desert. Our mission is to inspire people to live in harmony with the natural world by fostering love, appreciation, and understanding of the Sonoran Desert.",      
   mission_statement:"Where the desert comes alive", target_area: "Arizona", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Arts and Culture").id}
   charity_emails << "Arizon@groupgrant.com"

   charities << {image: "pic5", name: "Lindsay Wildlife Museum", eid: rand_eid, description: "LWM is a unique natural history and environmental education center where live, wild animals are just inches away. Visitors can listen to the cry of a red tailed hawk, go eye-to-eye with a gray fox and watch a bald eagle eat lunch.",
   mission_statement: "Connecting people with wildlife to inspire responsibility and respect for the world we share", target_area:"California", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Arts and Culture").id}
   charity_emails << "LindsayWildlife@groupgrant.com"

   charities << {image: "pic6", name: "Virginia Living Musuem", eid: rand_eid, description: "As the first living museum east of the Mississippi, we combine the  elements of a native wildlife park, science museum, aquarium, botanical preserve and planetarium.",
   mission_statement: "", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Arts and Culture").id}
   charity_emails << "VirginiaLiving@groupgrant.com"

   charities << {image: "pic7", name: "Academy of Achievements", eid: rand_eid, description: "For more than 45 years, the Academy of Achievement has sparked the imagination of students across America and around the globe by bringing them into direct personal contact with the greatest thinkers and achievers of the age.",
   mission_statement: "A museum of living history", target_area: "Washington DC", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Education").id}
   charity_emails << "Academyof@groupgrant.com"

   charities << {image: "pic8", name: "ACE Scholarships", eid: rand_eid, description: "ACE Scholarships was founded in 2000 to provide scholarships to children from low-income families in grades K-12, and to advocate for more choice for parents.",
   mission_statement:"Every child deserves a great education", target_area: "Colorado", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Education").id}
   charity_emails << "ACEScholarships@groupgrant.com"

   charities << {image: "pic9", name: "A Beka Foundation", eid: rand_eid, description: "The A Beka Foundation helps businesses, churches, and parents enroll into the A Beka programs.  You no longer have to make money a reason for not enrolling your child into ABA or ABB.",
   mission_statement:"Quality education for the people", target_area: "The World", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Education").id}
   charity_emails << "ABeka@groupgrant.com"

   charities << {image: "pic10", name: "A Place Called Home", eid: rand_eid, description: "We provide a safe, nurturing environment in South Central Los Angeles where underserved youth become the authors of their own lives and are inspired to make a meaningful difference in their community and the world.",
   mission_statement:"A positive environment where young people develop tools and are empowered to have successful, fulfilling lives", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Environment").id}
   charity_emails << "APlace@groupgrant.com"

   charities << {image: "pic11", name: "Acterra", eid: rand_eid, description: "Our long history of innovation and partnership enables us to draw on the wisdom and experience of two generations of environmental leaders.",
   mission_statement:"to bring people together to create local solutions that enhance the natural environment.", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Environment").id}
   charity_emails << "Acterr@groupgrant.com"

   charities << {image: "pic12", name: "Wyman Center", eid: rand_eid, description: "Our vision is to foster communities where every teen is expected and supported to thrive in life, work and learning so that they may become economically self-sufficient, leaders in their communities and, ultimately, break the cycle of poverty.",
   mission_statement: "Real teens. Real life. Real results.", target_area:"Missouri", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Health").id}
   charity_emails << "WymanCenter@groupgrant.com"

   charities << {image: "pic13", name: "Action on Smoking and Health", eid: rand_eid, description: "ASH is a national legal-action antismoking and nonsmokers' rights organization which helped ban cigarette commercials, started the modern nonsmokers' rights movement, pioneered using legal action against smoking, and much more.",
   mission_statement:"Everything for people concerned about smoking and nonsmokers' rights", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Health").id}
   charity_emails << "Actionon@groupgrant.com"

   charities << {image: "pic14", name: "Acumen Fund", eid: rand_eid, description: "We are a global venture fund that uses entrepreneurial approaches to solve the problems of global poverty.",
   mission_statement: "Building transformative businesses to solve the problems of poverty", target_area:"The world", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "AcumenFund@groupgrant.com"

   charities << {image: "pic15", name: "Alexander Graham Bell Association for the Deaf and Hard of Hearing", eid: rand_eid, description: "We help families, health care providers and education professionals understand childhood hearing loss and the importance of early diagnosis and intervention.",
   mission_statement: "", target_area: "USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "AlexanderGraham@groupgrant.com"

   charities << {image: "pic16", name: "Baptist Children's Home of NC", eid: rand_eid, description: "We provide residential placement and prevention services to help children and families overcome problems and challenges in 16 communities across the state",
   mission_statement:"Advocating Independence through Listening and Talking!", target_area:"USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "BaptistChildren@groupgrant.com"

   charities << {image: "pic17", name: "Bread of Life Missions", eid: rand_eid, description: "We exist to overcome the cycle of homelessness in people's lives through a Christ-centered complete recovery model with God's help.",
   mission_statement: "Helping hurting children . . . healing broken families", target_area: "North Carolina", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("International").id}
   charity_emails << "Breadof@groupgrant.com"

   charities << {image: "pic18", name: "Dare To Care Food Bank", eid: rand_eid, description: "Dare to Care Food Bank works to end hunger in our community through partnerships, innovative programs, and community engagement.",
   mission_statement: "Restoring dignity and hope", target_area: "Anywhere", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "DareTo@groupgrant.com"

   charities << {image: "pic19", name: "All God's Children", eid: rand_eid, description: "AGC is dedicated to orphaned and disadvantaged children of Honduras. We helped build and create Hogar de Ninos Nazareth, a refuge of care and compassion, where the children were given food, shelter, medical care, spiritual training and love.",
   mission_statement: "Leading our community to feed the hungry and conquer the cycle of need", target_area: "Kentucky", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "AllGod@groupgrant.com"

   charities << {image: "pic20", name: "HIAS", eid: rand_eid, description: "The Hebrew Immigrant Aid Society, has had an extraordinary impact on millions of Jews. For generation after generation, HIAS has provided essential lifesaving services to world Jewry, through its mission of rescue, reunion and resettlement.",
   mission_statement: "Dedicated to the orphaned and disadvantaged children of Honduras", target_area: "Honduras", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "HIA@groupgrant.com"

   charities << {image: "pic21", name: "Matthew 25 ministries", eid: rand_eid, description: "Matthew 25 Ministries (M25M) is an international humanitarian relief organization helping the poorest of the poor locally, regionally, nationally and internationally regardless of race, creed or political persuasion.",
   mission_statement: "Rescue, reunion and resettlement", target_area: "", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "Matthew25@groupgrant.com"

   charities << {image: "pic22", name: "Be the Match Foundation", eid: rand_eid, description: "Be The Match Foundation was created to secure support for the work of the National Marrow Donor Program. Thousands of patients with leukemia and other life-threatening diseases depend on us to raise funds to support the work of the NMDP.",
   mission_statement: "Caring for a needy world with the things we throw away", target_area: "worldwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "Bethe@groupgrant.com"

   charities << {image: "pic23", name: "Advocates International", eid: rand_eid, description: "AI seeks to encourage and enable a global network of skilled advocates committed to religious liberty, human rights, conflict resolution, and professional ethics. AI is guided in its mission and methods by Christ's Good Samaritan parable.",
   mission_statement:"A legacy of support for the National Marrow Donor Program", target_area:"USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Public Benefit").id}
   charity_emails << "AdvocatesInternational@groupgrant.com"

   charities << {image: "pic24", name: "Hands On Atlanta", eid: rand_eid, description: "Founded in 1989, Hands On Atlanta is a non-profit organization that helps individuals, families and corporate and community groups find flexible volunteer opportunities at more than 500 community-based agencies and schools.",
   mission_statement: "Doing justice with compassion", target_area: "Nationwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "HandsOn@groupgrant.com"

   charities << {image: "pic25", name: "Africa Bible Colleges Inc.", eid: rand_eid, description: "The vision of African Bible College is to offer quality, education with a Christian emphasis to the people of East and Central Africa. The chief aim of African Bible College is to train Godly men and women for Christian leadership and service.",
   mission_statement: "Do something good", target_area: "Atlanta", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "AfricaBible@groupgrant.com"

   charities << {image: "pic26", name: "Child Evangelism Fellowship", eid: rand_eid, description: "We are Bible-centered, worldwide organization composed of born-again believers whose purpose is to evangelize boys and girls with the Gospel of the Lord Jesus Christ and to establish (disciple) them in the local church for Christian living.",
   mission_statement:"To Train Godly Men and Women", target_area:"East and Central Africa", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "ChildEvangelism@groupgrant.com"

   charities << {image: "pic27", name: "Answers In Genesis", eid: rand_eid, description: "AiG is a Christianity-defending ministry, dedicated to enabling Christians to defend their faith, and to proclaim the gospel of Jesus Christ effectively.",
   mission_statement:"Reaching children worldwide", target_area:"worldwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "AnswersIn@groupgrant.com"

   charities << {image: "pic28", name: "Youths for Christ", eid: rand_eid, description: "YFC is dedicated to helping teens live a godly, moral lifestyle. Though this is contrary to the world, YFC aims to emphasize the benefits of moral living while reaching the teens for Christ.",
   mission_statement:"Believing it. Defending it. Proclaiming it.", target_area:"worldwide", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Religion").id}
   charity_emails << "Youthsfor@groupgrant.com"

   charities << {image: "pic29", name: "Senioritis Coorporation", eid: rand_eid, description: "Are you a senior, graduating, or just wish your senior year was here already? Do you feel like doing no homework at all? Join the club (literally)! We have the cure!",
   mission_statement:"Helping seniors everywhere", target_area: "PCC", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Human Services").id}
   charity_emails << "SenioritisCoorporation@groupgrant.com"

   charities << {image: "pic30", name: "Days End Farm horse Rescue", eid: rand_eid, description: "Days End Farm Horse Rescue (Days End) is a volunteer based, animal welfare organization established in 1989 to foster compassion and responsibility for horses through intervention, education and outreach.",
   mission_statement:"Ensuring quality care and treatment of horses through intervention, education, and outreach", target_area:"USA", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Animals").id}
   charity_emails << "DaysEnd@groupgrant.com"

   charities << {image: "pic31", name: "Civil War Trust", eid: rand_eid, description: "CWT has been America's largest non-profit organization devoted to preserving our nation's endangered Civil War battlefields. The Trust's 53,000 members and 155,000+ Facebook fans have helped save over 36,000 Acres of hallowed ground in 20 states.",
   mission_statement:"Saving America's Civil War Battlefields", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Other").id}
   charity_emails << "CivilWar@groupgrant.com"

   charities << {image: "pic32", name: "Boston Philharmonic Orchestra", eid: rand_eid, description: "Our message rings loud and clear- music making is a privilege and a joy, and above all, a collaborative adventure.",
   mission_statement:"Passionate music making without boundaries", target_area:"", video_url: "", video_url_html: "", cover_photo: nil, category_id: charity_categories.find_by_name("Other").id}
   charity_emails << "BostonPhilharmonic@groupgrant.com"
   
password = "groupgrant"

charities.each_with_index do |charity, index|
   image = charity[:image].to_s + '.jpg'
   charity.delete(:image)
   new_charity = Charity.create!(charity)
   user_attrs = {email: charity_emails[index], password: password, rolable_id: new_charity.id, rolable_type: "Charity", phone: rand_phone, is_available:1}
   if(!image.nil? && image != '.jpg')
     # add_pic = {profile: File.open(File.join(Rails.root, "db", "seeds", "charity_pics", image))}
     # user_attrs.merge!(add_pic)
   end
   User.create!(user_attrs)
end

charities = Charity.all

###################################################################################
#                        Populate the database with businesses                    #
###################################################################################

businesses = []
business_emails = []
   businesses << { image: "pic1", name: "Petco", description: "Something extraordinary happens when pets and people connect. A unique bond is formed that results in something powerful, not only between pets and people, but in a way that makes the world a better place. Our promise is to nurture that relationship completely-mind and body.",
     location:"", goods: "", services:"", interests:"", category_id:  BusinessCategory.find_by_name("Animals").id}
   business_emails << "Petco@groupgrant.com"

   businesses << { image: "pic2", name: "Petsmart", description: "As the largest specialty pet retailer of services and solutions for the lifetime needs of pets, we employ approximately 52,000 associates and operate 1,289 stores and more than 196 in-store PetSmart PetsHotels dog and cat boarding facilities in the United States, Canada and Puerto Rico. We provide a broad range of competitively priced pet products and in-store services including pet adoption, boarding, grooming and training. Our stores are stocked with more than 10,000 products and we are also a leading online provider of pet supplies and pet care information.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Animals").id}
   business_emails << "Petsmart@groupgrant.com"

   businesses << { image: "pic3", name: "32 Degrees Yogurt Bar", description: "32 DEGREES A YOGURT BAR is a self serve frozen yogurt bar that is fun for friends, family and anyone looking to satisfy a sweet tooth! At 32 DEGREES A YOGURT BAR, we offer 16 individual flavors of yogurt to include fat free, kosher, no sugar added and low sugar selections, all on a rotating basis. Our flavors change often with choices such as Tahitian vanilla, Cookies and Cream, Birthday Cake, California Tart, Sea Salted Caramel Pretzel and Watermelon sorbet. 32 DEGREES A YOGURT BAR specializes in serving the freshest toppings including daily hand cut fruits, seasonal favorites, and over 40 candy, nut and sauce options.",
     location:"", goods: "", services:"", interests:"", category_id:BusinessCategory.find_by_name("Food Services").id}
   business_emails << "32Degrees@groupgrant.com"

   businesses << { image: "pic4", name: "A Flower Shop", description: "Visit A Flower Shop for the best flower arrangements and gifts in Pensacola, FL! Our professional florists can help you find the perfect flowers for any individual or occasion and can even create a custom bouquet to fit your unique needs. A Flower Shop delivers flower arrangements throughout Pensacola and offers same-day delivery for your last-minute gift needs at no extra cost! A Flower Shop can also deliver quality flowers nationwide through our trusted florist network.",
     location:"", goods: "", services:"", interests:"", category_id:BusinessCategory.find_by_name("Environment").id}
   business_emails << "AFlower@groupgrant.com"

   businesses << { image: "pic5", name: "Ambassador Cleaners", description: "Ambassador Dry Cleaning & Laundry is a full service cleaner. We provide professional Dry Cleaning and Laundering of a wide range of products, and all work is done in our own plant. With over 50 years of experience, and our own facility of over 10,000 sq. ft of Dry Cleaning, Laundry, and pressing equipment; we can assure you the quality and reliability that you expect.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Public Benefit").id}
   business_emails << "Ambassador@groupgrant.com"

   businesses << { image: "pic6", name: 'Baptist Hospital', description: "At Baptist Health Care we take care of the whole person. Our experienced, compassionate team of healthcare providers is recognized across the country as tops in patient satisfaction. We give the highest level of quality care using the latest technology with the utmost respect for our patients.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Health").id}
   business_emails << "Baptist@groupgrant.com"

   businesses << { image: "pic7", name: "Southern Capital Services (Investment)", description: "Southern Capital Services, Inc. was founded in 1982 by Terry Nager, Certified Financial Planner (CFP).  Throughout the 1980s Terry designed comprehensive financial plans for his clients and investment advice with a fee offset for clients who purchased securities through him. Today Southern Capital stands as a long-standing Investment Advisory firm in the Mobile area, with clients around the country. The firm looks forward to many more years of growth and prosperity through helping clients meet their investment objectives.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Other").id}
   business_emails << "Southern@groupgrant.com"

   businesses << { image: "pic8", name: "State Farm Insurance", description: "State Farm, well known for being a \"good neighbor\" by \"being there\" for our customers, was founded in 1922 by retired farmer and insurance salesman George Jacob \"G.J.\" Mecherle. We now insure more cars and homes than any other insurer in the U.S., and we are one of the leading insurers in Canada. A mutual company owned by its policyholders, State Farm is currently ranked number 34 on the Fortune 500 list of largest companies.", 
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Health").id}
   business_emails << "State@groupgrant.com"

   businesses << { image: "pic9", name: "Vitamin Shoppe", description: "The Vitamin Shoppe's retail stores and online sites carry a line of nutritional supplements[6] with supplementary lines, such as Vitamin Shoppe's M.D. Select (a line put together by Dr. Ronald Hoffman) and the Bodytech brand of sports supplements. In addition to their own brands, the company carries third-party lines, including professional and specialized lines.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Health").id}

   business_emails << "Vitamin@groupgrant.com"

   businesses << { image: "pic10", name: "Wal-Mart", description: "Walmart helps people around the world save money and live better anytime and anywhere in retail stores, online and through their mobile devices. Each week, more than 245 million customers and members visit our 11,000 stores under 69 banners in 27 countries and e-commerce websites in 10 countries. With fiscal year 2013 sales of approximately $466 billion, Walmart employs 2.2 million associates worldwide.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Food Services").id}
   business_emails << "Wal@groupgrant.com"

   businesses << { image: "pic11", name: "Wells Fargo Bank", description: "We believe in our vision and values just as strongly today as we did the first time we put them on paper more than 20 years ago. Staying true to them will guide us toward continued growth and success for decades to come. As you read more about our vision and values, you will learn about who we are, where we're headed and how every Wells Fargo team member can help us get there.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Finance").id}
   business_emails << "Wells@groupgrant.com"

   businesses << { image: "pic12", name: "Wade Air Conditioning", description: "We're all about air cool air, warm air, clean air. As a world leader in air conditioning systems, services and solutions, we control the comfort of the air for people in homes and many of the world's largest and most famous commercial, industrial and institutional buildings. And we're applying Trane's expertise in environmental technology and energy conservation to make a difference in energy efficiency around the globe.",
     location:"", goods: "", services:"", interests:"", category_id:BusinessCategory.find_by_name("Other").id}
   business_emails << "Wade@groupgrant.com"

   businesses << { image: "pic13", name: "Affiliated Insurance", description: "Affiliated Insurance Services, LLC. is an independent insurance agency providing individuals and businesses with a full range of insurance programs by providing individually tailored plans using only products offered by nationally known and financially sound companies, designing a program that will reduce your losses and control your insurance costs, and handling your claims with prompt and efficient service.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Human Services").id}
   business_emails << "Affiliated@groupgrant.com"

   businesses << { image: "pic14", name: "Geico Life Insurance", description: "If you think about it for a minute, you insure everything that's significant in your life; why not insure yourself? You are priceless after all (or at least pretty close to priceless). Life insurance helps provide you peace of mind and can provide your family with financial stability and security when it matters most.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Human Services").id}
   business_emails << "Geico@groupgrant.com"

   businesses << { image: "pic15", name: "Oh Snap Cupcakes", description: "At Oh Snap! Cupcakes we bake from scratch every day to provide you with the highest quality cupcakes here on the Gulf Coast. We also cater to all of your special event needs including Weddings, Baby Showers, Birthdays, Parties, and any other milestones!",
     location:"", goods: "", services:"Cupcakes", interests:"", category_id: BusinessCategory.find_by_name("Food Services").id}
   business_emails << "OhSnap@groupgrant.com"

   businesses << { image: "pic16", name: "Opti-Club", description: "If you are looking for quality eyeglasses, contact lenses, designer frames, or prescription sunglasses then you should check out Opti-Club. We also carry kid's glasses, designer eyeglass frames, and specialty lenses. Eye exams are also available.", 
     location:"", goods: "", services:"glasses", interests:"", category_id: BusinessCategory.find_by_name("Other").id}
   business_emails << "Opti@groupgrant.com"

   businesses << { image: "pic17", name: "Pensacola Christian College",  description: "At Pensacola Christian College, not only will you receive an exceptional and distinctively Christian liberal arts education, but you'll also form lasting friendships and make unforgettable memories. As you prayerfully consider God's will for your life, we encourage you to choose PCC to train for your future.",
     location:"", goods: "", services:"", interests:"", category_id:BusinessCategory.find_by_name("Education").id}
   business_emails << "PensacolaChristian@groupgrant.com"

   businesses << { image: "pic18", name: "Pensacola International Airport", description: "Every aspect of Pensacola International Airport has been designed with you in mind. Our airport is beautifully designed and laid out for your convenience with easy access to gates, baggage claims, check-in, and parking. Southern hospitality begins here with comfortable seating areas, gift shops and lounges while you wait for your flight. Whether you are here for a visit, looking for a place to launch your business enterprise, or connecting to another flight, welcome.",
     location:"", goods: "", services:"", interests:"", category_id:BusinessCategory.find_by_name("Other").id}
   business_emails << "PensacolaInternational@groupgrant.com"

   businesses << { image: "pic19", name: "Pensacola Ice Flyers", description: "The Pensacola Ice Flyers are a professional ice hockey team of the Southern Professional Hockey League. The team played their first season in 2009-2010.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Entertainment").id}
   business_emails << "PensacolaIce@groupgrant.com"

   businesses << { image: "pic20", name: "Six Flags", description: "Six Flags Entertainment Corp. is the world's largest amusement park corporation based on number of properties, and the fifth-most popular in terms of attendance.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Entertainment").id}
   business_emails << "Sixflags@groupgrant.com"

   businesses << { image: "pic21", name: "Chuck E. Cheese", description: "We believe that today, more than ever, kids need a safe, wholesome environment in which they can laugh, play and simply be kids. We take pride in providing an experience that kids and parents will love coming back to.",
     location:"", goods: "", services:"", interests:"", category_id: BusinessCategory.find_by_name("Entertainment").id}
   business_emails << "ChuckE@groupgrant.com"

businesses.each_with_index do |business, index| 
   image = business[:image].to_s + '.jpg'
   business.delete(:image)
   new_business = Business.create!(business)
   user_attrs = {email: business_emails[index], password: password, rolable_id: new_business.id, rolable_type: "Business", phone: rand_phone, is_available:1}
   
   if(!image.nil? && image != '.jpg')
     #add_pic = {profile: File.open(File.join(Rails.root, "db", "seeds", "business_pics", image))}
     #user_attrs.merge!(add_pic)
   end

   User.create!(user_attrs)
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



stock_location = Spree::StockLocation.create!(
   name: 'Default Stock'
)

shipping_cat = Spree::ShippingCategory.create!(
   name: 'Default Shipping'
)

tax_cat = Spree::TaxCategory.create!(
   name: 'Default Tax',
   description: "Just default",
   is_default: true
)
Spree::TaxRate.create(
   name: "default",
   amount: 0.05
)

Spree::Country.create!(
   name: 'United States',
   iso_name: 'US',
   states_required: false
)

zone = Spree::Zone.create(
   name: "All",
   description: "default",
   default_tax: true
)

# Spree::ShippingMethod.create!(
#    name: "United States Postal Service"
# )



defaults = {
   # tax_category: Spree::TaxCategory.first,
   meta_keywords: "this is meta",
   meta_description: "this is meta descripiton",
   shipping_category: Spree::ShippingCategory.first,
   available_on: 3.days.ago,
    }

products = [
   {
      name: "first Product",
      price: 50,
      description: "description goes here",
   },
   {name: "FireX Hardwired Interconnected 120-Volt Smoke Alarm with Battery Backup", 
   image: "Smokealarm1",
   price: "14.97",
   description: "FireX i4618 alarm is a 120V hardwire smoke alarm and battery back-up feature. Utilizes ionization technology that may detect fast flaming fires sooner than photoelectric. Install this alarm in your home to provide you and your family an early warning in the event of a fire. Battery back-up feature provides protection even during power outages and the smart hush feature will silence false alarms.
   Front loading battery feature for easy battery change, no need to remove the alarm from the ceiling
   Test/reset button allows you to check on the sensor's functionality and cease false alarms
   9 Volt battery backup provides protection during power outages
   Pre-stripped wiring harness with easy off cap provides easy access to wiring components
   Interconnectable feature with up to 24 devices of which 18 can be initiating
   Unit is equipped with piezoelectric horn that is rated at 85 decibels at 10 ft.
   Specifications: 
   Alarm Sensor Type    Ionization  Alarm Type  Smoke 
   Alarm/Detector Features    Battery Back-Up,Hush Feature,Interconnected  Assembled Depth (in.)   3 in 
   Assembled Height (in.)  6.25 in  Assembled Width (in.)   6.63 in 
   Battery Back-Up   Yes   Battery Power Type   Alkaline 
   Battery Size   Duplex   Certifications and Listings   1-UL Listed 
   Commercial / Residential   Commercial / Residential   Connector/Contact Type  2-Wire 
   Digital Display   No    Electrical Product Type    Smoke Detector 
   Included    Battery (-ies)    Returnable  90-Day 
   Voltage (volts)   120"},

   {name: "Werner 2-Story Not Rated Fire Escape Ladder with 375 lb. Load Capacity", 
   image: "Escapeladder1",
   price: "99.00",
   description: "The Werner 2-Story Fire Escape Ladder features 12 non-slip steps and mounts easily to an existing wall. The self-deploying ladder rungs extend into a full ladder when dropped out of your window. Can be painted to match your wall.
   Aluminum rungs with nylon webbing rails
   Door included with unit
   Anti-slip rungs and standoffs
   Storage pan permanently installs in wall
   Faster escape supports up to 1200 lbs.
   Specifications: 
   Assembled Depth (in.)   4.75 in  Assembled Height (in.)  8.5 in 
   Assembled Width (in.)   15.25 in    Certifications and Listings   No Certifications or Listings 
   Ladder Height (ft.)  17    Ladder Length  17.2 ft 
   Ladder Rating  Type 1AA - 375 lbs.  Load weight capacity    375 lb. 
   Manufacturer Warranty   none  Material    Aluminum 
   Maximum story number    2  Nonslip tread  12 
   Number of Steps   12    Product Weight (lb.)    16 
   Returnable  90-Day   Rung/Step Depth   2.25 in 
   Step rise (in.)   14.25    Weather Resistant    No"},

   {name: "Lithonia Lighting 4-Light White Fluorescent Troffer (28-Pallet)", 
   image: "Light1",
   price: "1498",
   description: " The Lithonia Lighting 4-Light Prewired and Lamped Multi-Volt Fluorescent Troffer comes prewired with lamps installed for easy installation. It features a clear, prismatic acrylic lens and a white steel frame. This low-profile Troffer provides general illumination in grid ceiling applications.
   Pallet buy consists of 28 troffers
   Clear, prismatic acrylic lens
   Energy efficient T8 fluorescent technology
   Includes four 32 watt T8 4100K fluorescent bulbs (per fixture) pre-installed for easy installation
   Multi-volt (120- to 277-volt) electronic ballast
   6 ft. prewired with 3/8 in. 18-gauge flex
   Specifications: 
   Actual Color Temperature (K)  4100  Assembled Depth (in.)   48 in 
   Assembled Height (in.)  3.19 in  Assembled Width (in.)   24 in 
   Certifications and Listings   1-UL Listed    Color Rendering Index   85 
   Commercial Light Type   Troffer  Dimmable    No 
   ENERGY STAR Certified   No    Fixture Color/Finish Family   Whites 
   Length/circumference (in.)    49.5  Light Bulb Base Code    Twist Lock 
   Light Source   Fluorescent    Manufacturer Warranty   1 year 
   Number of Bulbs Required   4  Product Weight (lb.)    25 
   Required bulb type   T8    Returnable  90-Day 
   Wattage (watts)   32"},

   {name: "Lithonia Lighting 2-Light Thermoplastic LED Emergency Exit Sign/Fixture Unit Combo with Incandescent Heads", 
   image: "Exitsign1",
   price: "89.76",
   description: "The Lithonia Lighting Quantum 2-Light Thermoplastic LED Emergency Exit Sign/Fixture Unit Combo is good for an area requiring both an exit sign and emergency lighting. It features an attractive, streamlined design that is great for above-the-door applications and other tight fits. Unique track-and-swivel arrangement permits full range of direction of lamp head adjustment.
   Streamlined design is good for a tight fit, such as above a door
   Side-mount lamp heads reduce overall height
   Engineering-grade thermoplastic housing is impact- and scratch-resistant
   UV-stabilized white resin resists discoloration from both natural and man-made light sources
   Rugged uni-body housing snaps together with no additional fasteners
   Replaceable chevron directional indicator knockouts offer choice of direction
   UL94V-O flame rating
   Requires 2 LED bulbs, 4 watt maximum (included)
   Specifications: 
   Actual Color Temperature (K)  0  Assembled Depth (in.)   26 in 
   Assembled Height (in.)  11 in    Assembled Width (in.)   5 in 
   Certifications and Listings   1-UL Listed    Color Rendering Index   0 
   Commercial Light Type   Exit and Emergency   ENERGY STAR Certified   No 
   Emergency run time (min.)  90.0  Fixture Color/Finish Family   Whites 
   Hardwired or Plug-In    Hardwired   Light Bulb Base Code    Other 
   Light Source   LED   Manufacturer Warranty   Five year manufacturers warranty 
   Material    Plastic  Number of Bulbs Required   2 
   Powered  Yes   Product Depth (in.)  1.94 in 
   Product Height (in.)    8.3 in   Product Weight (lb.)    4.6 lb 
   Product Width (in.)  16.4 in  Returnable  90-Day 
   Wattage (watts)   4 W"},

   {name: "Lithonia Lighting 2-Light Utility Light", 
   image: "Light2",
   price: "24.87",
   description: " The Lithonia Lighting 2-Light Utility Light uses a clear, prismatic acrylic lens with white steel end plates to provide widespread illumination. This light features a continuous-interlocking design for easy installation, lamp access and cleaning.
   Uses a clear, prismatic acrylic lens with white steel end plates
   Diffuser features a continuous-interlocking design for easy installation, lamp access and cleaning
   Slim, wraparound design fits narrow ceiling areas
   Requires two 32-watt T8 straight tube lamps
   Energy Star qualified to meet or exceed federal guidelines for energy efficiency for year-round energy and money savings
   UL listed
   Specifications: 
   Accessory Type    Wrap  Assembled Depth (in.)   3 in 
   Assembled Height (in.)  50 in    Assembled Width (in.)   6 in 
   Certifications and Listings   1-UL Listed    Color Family   White 
   Commercial Light Type   Wraparound  Manufacturer Warranty   Guaranteed one year for defects in manufacture. 
   Material    Metal    Number in Pack    1 
   Product Depth (in.)  3 in  Product Height (in.)    50 in 
   Product Weight (lb.)    8 lb  Product Width (in.)  6 in 
   Returnable  90-Day   Style    Traditional"},

   {name: "Lithonia Lighting Lead-Calcium Plastic 6-Volt Emergency/Exit Lighting Replacement Battery", 
   image: "Battery1",
   price: "21.86",
   description: " The Lithonia Lighting Lead-Calcium 6-Volt Replacement Battery for Emergency/Exit Lighting. This battery is rechargeable for your convenience. This replacement battery features lead-calcium storage for lasting use.
   Lead-calcium battery
   Replacement battery for use in exit/emergency light products
   For UL-listed exit signs
   6-volt battery
   4 Ah
   Rechargeable
   Specifications: 
   Actual Color Temperature (K)  0  Assembled Depth (in.)   6.25 in 
   Assembled Height (in.)  6.37 in  Assembled Width (in.)   6 in 
   Certifications and Listings   1-UL Listed    Color Rendering Index   0 
   Commercial Light Type   Exit and Emergency   ENERGY STAR Certified   No 
   Emergency run time (min.)  90    Fixture Color/Finish Family   Black 
   Hardwired or Plug-In    Neither  Light Bulb Base Code    Other 
   Light Source   Incandescent   Manufacturer Warranty   1 year 
   Material    Plastic  Number of Bulbs Required   0 
   Powered  No    Product Depth (in.)  4 
   Product Height (in.)    4  Product Weight (lb.)    2 
   Product Width (in.)  6  Returnable  90-Day 
   Wattage (watts)   0"},

   {name: "Cooper Bussmann FRN Series 20 Amp Brass Time Delay Fuse Cartridges (2-Pack)", 
   image: "Fuse1",
   price: "12.64",
   description: "The Cooper Bussmann FRN Series 20 Amp Brass Time Delay Fuse Cartridges (2-Pack) have fiberglass tubes and are current limiting, Class RK5, dual-element time-delay fuses with a 10-second minimum at 500% design. Typical applications include power panel boards, motor control centers, combination starters and machinery disconnects. These fuse cartridges are UL- and CSA listed for safety.
   Used in power panel boards, motor control centers, combination starters and machinery disconnects
   Operating maximum of 30 Amp s
   Operating maximum of 250 volts
   UL listed
   Specifications: 
   Assembled Depth (in.)   5.5 in   Assembled Height (in.)  0.5 in 
   Assembled Width (in.)   2.75 in  Certifications and Listings   1-UL Listed,CSA Listed 
   Electrical Product Type    Fuse  Fuse Type   Cartridge 
   Manufacturer Warranty   NONE  Material    Paper 
   Maximum Amperage (amps)    30 A  Number in Package    2 
   Product Diameter (in.)  0.56 in  Product Length (in.)    2 
   Product Weight (lb.)    0.50  Time Delay  Yes 
   Voltage (volts)   250"},

   {name: "GE 200 Amp 240-Volt Non-Fused Emergency Power Transfer Switch", 
   image: "Powerswitch1",
   price: "324.00",
   description: "Run your backup generator with the GE 200 Amp 240-Volt Non-Fused Emergency Power Transfer Switch. This emergency power transfer switch offers a NEMA type-3R metal enclosure for outdoor use. For use with 6 - 250 AWG/kcmil copper or aluminum lug wire, this transfer switch is rated for safety with a UL listing and an ANSI certification.
   Ideal for running your back-up generator
   Metal construction
   Double-throw, non-fusible design
   NEMA type-3R enclosure for outdoor use
   Single-phase, 3-wire SN, 200 Amp 120/240 VAC
   Accommodates 6 - 250 AWG/kcmil copper or aluminum lug wire
   Meets UL and ANSI safety requirements
   Specifications: 
   Assembled Depth (in.)   16.3 in  Assembled Height (in.)  30.8 in 
   Assembled Width (in.)   10 in    Certifications and Listings   1-UL Listed,ANSI Certified 
   Electrical Product Type    Transfer Switch   Fusible  No 
   Manufacturer Warranty   Lifetime Warranty    Maximum Amperage (amps)    200 A 
   Maximum Wattage   0 W   Number of phases  1 
   Product Depth (in.)  30.75    Product Height (in.)    10 
   Product Weight (lb.)    37.6  Product Width (in.)  15.625 
   Returnable  90-Day   Safety Switch Type   Safety 
   Voltage (volts)   240"},

   {name: "Zinsco Thick 30 Amp 1-1/2 in. Double-Pole Type Z UBI Replacement Circuit Breaker", 
   image: "Breaker1",
   price: "59.97",
   description: " 
   The Zinsco Thick 30 Amp 1-1/2 in. Double-Pole Type Z UBI Replacement Circuit Breaker is suitable for use in typical applications up to 13,200 watts, such as hot water heaters, clothes dryers, air conditioners and electric motors. The HACR-rated breaker is compatible with Zinsco thick series load centers.
   For use in typical applications up to 13,200 watts
   #10-2 copper with ground wire
   120/240 VAC
   Type Z for use in Zinsco load centers
   240-volt air conditioners up to 36,000 BTUs and 240-volt electric motors 1.5 - 3 HP
   HACR rated
   Specifications: 
   Arc Fault Interrupter   No    Assembled Depth (in.)   5 in 
   Assembled Height (in.)  2.5 in   Assembled Width (in.)   1.5 in 
   Certifications and Listings   ETL Listed  Electrical Product Type    Breaker 
   Ground Fault Interrupter   No    Manufacturer Warranty   1 Year 
   Maximum Amperage (amps)    30 A  Mounting type  Plug In 
   Number of Poles   2  Product Depth (in.)  5 
   Product Height (in.)    2.5   Product Series    UBI 
   Product Weight (lb.)    .85   Product Width (in.)  1.5 
   Returnable  90-Day   Voltage (volts)   240"},

   {name: "Cerrowire 250 ft. 12/2 UF-B Wire", 
   image: "Wire1",
   price: "90.30",
   description: "This 250 ft. Underground Feeder Cable is designed to be directly buried into the ground as a non-metallic sheathed cable. Jacketed in insulated PVC, this cable is resistant to sunlight for durability. This cable is UL listed.
   250 ft. length
   12 gauge
   Ideal for feeder or branch circuit cable
   Copper conductor material
   Cable can be used in wet or dry locations
   Copper conductors
   Note: Product may vary by store.
   Specifications: 
   Allowable Ampacities    20    Assembled Depth (in.)   14 in 
   Assembled Height (in.)  3.3 in   Assembled Width (in.)   14 in 
   Cable/Wire Type   UF-B  Certifications and Listings   1-UL Listed 
   Commercial / Residential   Commercial / Residential   Conductor Gauge   12 
   Conductor Material   Copper   Electrical Product Type    Service Entry Electrical Cable 
   Flame retardant   No    Grounded    Yes 
   Indoor/Outdoor    Indoor/Outdoor    Jacketed    Yes 
   Manufacturer Warranty   NO    Number of Conductors    2 
   Outer Color    Grey  Product Length (ft.)    250 ft 
   Returnable  90-Day   Shielded    No 
   Stranded or Solid    Solid    Sunlight / UV Resistant    Yes 
   Voltage (volts)   600   Wet Location Use  Yes 
   Wire/Cable Length (ft.)    250"},

   {name: "Cerrowire 500 ft. 10/2 UF-B Wire - Grey", 
   image: "Wire2",
   price: "298.20",
   description: " 
   500 ft. 10/2 UF-B Wire can be used outdoors, underground and in wet areas. The jacketed wire is sun and UV resistant. Copper conductors. UL listed.
   For outdoor and underground use
   Can be used in wet areas
   500 ft. length
   10 gauge
   Sunlight, UV, oil and gas resistant
   Jacketed
   Note: product may vary by store
   Specifications: 
   Allowable Ampacities    30    Assembled Depth (in.)   12 in 
   Assembled Height (in.)  13 in    Assembled Width (in.)   12 in 
   Cable/Wire Type   UF-B  Certifications and Listings   1-UL Listed 
   Commercial / Residential   Commercial / Residential   Conductor Gauge   10 
   Conductor Material   Copper   Electrical Product Type    Service Entry Electrical Cable 
   Flame retardant   No    Grounded    Yes 
   Indoor/Outdoor    Indoor/Outdoor    Jacketed    Yes 
   Manufacturer Warranty   NO    Number of Conductors    2 
   Outer Color    Grey  Product Length (ft.)    500 ft 
   Returnable  90-Day   Shielded    No 
   Stranded or Solid    Solid    Sunlight / UV Resistant    Yes 
   Voltage (volts)   600   Wet Location Use  Yes 
   Wire/Cable Length (ft.)    50"},

   {name: "Cerrowire 100 ft. 14 Gauge 5-Conductor Portable Power Soow Cord - Black", 
   image: "Wire3",
   price: "136.00",
   description: " 14-5 gauge type SOOW flexible cord is designed for extra hard usage on industrial equipment, heavy tools, battery chargers, portable lights, welding leads, marine dockside power, power extensions, and mining applications. SOOW flexible cords are also UL and CSA listed for continuous submersion in water. Jacket is heat, moisture, and oil resistant.
   Jacket is sunlight resistant
   Rated up to 600-Volts
   2,3,4 or 5 Flexible stranded class K copper conductors
   UL listed
   Specifications: 
   Allowable Ampacities    not specified  Assembled Depth (in.)   12.25 in 
   Assembled Height (in.)  8.125 in    Assembled Width (in.)   12.25 in 
   Cable/Wire Type   SOOW  Certifications and Listings   1-UL Listed 
   Commercial / Residential   Commercial / Residential   Conductor Gauge   14 
   Conductor Material   Copper   Direct Burial  No 
   Electrical Product Type    Mutli-Use Electrical Cord  Flame retardant   Yes 
   Grounded    Yes   Jacketed    Yes 
   Manufacturer Warranty   No    Number of Conductors    5 
   Outer Color    Black    Product Length (ft.)    100 ft 
   Returnable  90-Day   Shielded    No 
   Stranded or Solid    Stranded    Sunlight / UV Resistant    Yes 
   Voltage (volts)   600   Wet Location Use  No 
   Wire/Cable Length (ft.)    100"},

   {name: "L.I.F Industries 36 in. x 80 in. Flush Gray Exit Right-Hand Fire Proof Door Unit with Welded Frame", 
   image: "Door1",
   price: "718.80",
   description: "
   Heavy duty steel flush unit with exit device and commercial grade lever entrance trim installed and welded frame. Complete with a commercial grade lever entrance lockset and spring hinges in a satin chrome finish. Equipped with a 90 min. fire and smoke label. Manufactured with the highest quality mill primed galvanized steel that is satin smooth to the touch and ready to receive premium latex or oil based paint once cleaned. Frame made for a wall thickness of 4-7/8 in. And used primarily in new masonry or drywall construction when the wall is being built. Frame comes complete with combination anchors for either masonry or drywall applications. Installation instructions as well as finishing guidelines and warranty information can be downloaded for your convenience.
   Ships in 10 days
   Heavy duty steel to secure and protect your home or building
   Ready to install
   Environmentally friendly
   Heavy duty steel door and frame provides long lasting durability and carefree use
   Provides protection from the spread of both fire and smoke
   Can be used in both interior and exterior walls
   Steel frame provides superior protection compared to normal wood jambs
   Commercial grade weather stripping sold separately provides added protection against the elements
   Satin smooth steel surface allows for easy painting for any color match
   Commercial grade hardware for additional security and long lasting durability
   Specifications: 
   Assembled Depth (in.)   6 in  Assembled Height (in.)  82 in 
   Assembled Width (in.)   40 in    Brickmould  No 
   Color/Finish   Gray  Commercial  Yes 
   Design Pattern    Other    Door Color Family    Grey 
   Door Configuration   Single Door    Door Handing   Right-Hand/Outswing 
   Door Size   36 in. X 80 in.   Door Swing  Right Hand 
   Door Thickness (in.)    1.75 in  Door Type   Exterior Prehung 
   Door Width (in.)  35.75    Door height (in.)    79 
   ENERGY STAR Certified   No    Finish Type    Unfinished 
   Finished Opening Height (in.)    82    Finished Opening Width (in.)  40 
   Fire rating    90 minute   Hinge Finish   Chrome 
   Hurricane rated   No    Manufacturer Warranty   1 Year limited 
   Number of Hinges  3.0   Number of panels  0 
   Paintable/Stainable  Yes   Product Weight (lb.)    120 
   Returnable  90-Day   Rough Opening Height    82.125 in"},

   {name: "Aleco ImpacDor FS-500 3/4 in. x 60 in. x 96 in. Charcoal Gray Wood Core Impact Door", 
   image: "Door2",
   price: "1483.00",
   description: "
   Aleco ImpacDor FS-500 is a versatile 3/4 in. (19 mm) door with wood core and ABS facings for demanding food service, retail and light industrial applications seeking to provide a visual barrier or a damper to air currents in busy doorways. Colorful 1/8 in. (3 mm) ABS facings are bonded to a 1/2 in. (13 mm) solid core to resist palletized loads, yet remain light enough to swing freely in high volume foot traffic. This versatile, attractive door is supported by the easily installed stainless steel EZ hinge system for two-way 125 degree swing. The hinges unique offset pivot ensures smooth, effortless operation to facilitate traffic flow. Features rigid solid core with reinforced metal spine, 11-1/2 in. x 15-1/2 in. dual pane windows and stainless steel 8-3/4 in. jamb guards.
   Rigid solid core
   Reinforced metal spine
   Colorful 1/8 in. (3 mm) ABS facings are bonded to a 1/2 in. (13 mm) solid core to resist palletized loads
   Light enough to swing freely with heavy foot traffic
   Serves as a visual barrier
   Serves as a sound barrier
   Two-way 125 degree swing
   EZ hinge installs and operates effortlessly
   EZ Hinge has a 5-year limited warranty
   Ideal for food service, retail and light industrial applications
   Specifications: 
   Assembled Depth (in.)   .75 in   Assembled Height (in.)  84 in 
   Assembled Width (in.)   60 in    Color Family   Gray 
   Commercial  Yes   Core Type   Wood 
   Door Color Family    Grey  Door Thickness (in.)    .75 in 
   Door Width (in.)  60    Manufacturer Warranty   Standard one year (from date of shipment) limited against defects in material and workmanship and is limited to the replacement of any part or parts which prove to be defective. 5 year limited warranty on EZ Hinge 
   Product Weight (lb.)    165   Returnable  90-Da"},

   {name: "Port-A-Cool 9600 CFM 3-Speed Portable Evaporative Cooler for 2500 sq. ft.", 
   image: "Cooler1",
   price: "2399.00",
   description: "
   Port-A-Cool portable evaporative cooling units utilize a unique, patented housing design and KL Pads high efficiency rigid cooling media to produce effective and efficient cooling even in high relative humidity conditions. The Port-A-Cool 36 in. 3-speed model cools up to 2,500 square feet making it perfect for hospitality tents, warehouses, factories, work shops, large work areas, outdoor recreational areas anywhere air conditioning is ineffective or cost prohibitive. Port-A-Cool portable evaporative cooling units perform at a fraction of the cost of standard air-conditioning while lowering the surrounding air temperature by as much as 15 to 25 degrees Fahrenheit, resulting in an average utility cost of 7.5-cents to 28.2-cents per hour, depending on unit size. Port-A-Cool units are environmentally friendly and provide long-term dependability plus near maintenance-free operation. This evaporative cooler performs best in dry, arid climates.
   Lowers temperatures 15 - 25 degrees F
   Cools up to 2,500 square feet
   Powerful 9,600 CFM
   32 gallon water reservoir for longer operation
   Three-speed motor
   New cord-wrap storage
   Made in the U.S.A.
   Virtually maintenance free
   Shipped completely assembled - ready to operate out of the box
   New easy rolling poly-on-poly casters
   3/4 in. garden hose connection for longer operation
   Specifications: 
   Air Volume (CFM)  9600  Amperage (amps)   11.5 
   Assembled Depth (in.)   32 in    Assembled Height (in.)  67 in 
   Assembled Width (in.)   62 in    Built-in HEPA filter    No 
   Built-in carbon filter  No    Casters  Yes 
   Certifications and Listings   1-UL Listed    Color    Black 
   Color Family   Blacks   Commercial / Residential   Commercial / Residential 
   Cooling zone (sq. ft.)  2500  Cord Length (in.)    120 
   Evaporative Cooler Product Type  Portable Cooler   Horsepower (hp)   1/2 hp 
   Manufacturer Warranty   1 Year   Number of Speed Settings   3 
   Product Depth (in.)  32    Product Height (in.)    67 
   Product Weight (lb.)    205   Product Width (in.)  62 
   Programmable Timer   No    Remote Control    No 
   Returnable  90-Day   Voltage (volts)   115"},

   {name: "MasterCool 5000 CFM 2-Speed Side-Draft Roof 12 in. Media Evaporative Cooler for 1650 sq. ft. (with Motor)", 
   image: "Cooler2",
   price: "1499.00",
   description: "
   This MasterCool down-discharge evaporative cooler is American-made and provides an economical, environmentally-friendly means of cooling up to 1650 sq. ft. Engineered for maximum airflow and superior durability, the MasterCool line of coolers not only saves energy dollars, but provides years of worry-free cooling comfort for you and your family. This unit is complete and ready to install. ATTENTION: This evaporative cooler performs best in dry, arid climate.
   Circulates air at up to 5000 CFM
   Cools up to 1650 sq. ft. for whole-house cooling
   Comes with a 3/4 HP, 2 speed, 115-volt motor, pump, rigid media, pulley, purge system and deluxe thermostat
   Uses high performance 12 in. rigid media
   Exterior surfaces electro-statically coated for weather and impact resistance
   Unique perforated air inlet screen provides more air flow than the competition
   Thermoplastic water reservoir prevents corrosion
   Up to 75% energy savings over traditional air conditioning
   Single inlet design for maximum cooling
   Engineered for easy access and maintenance
   UL classified for safe operation
   Ideal for dry, arid climates
   Made in Denison, TX, USA
   Specifications: 
   Air Volume (CFM)  5000  Amperage (amps)   14.9 
   Assembled Depth (in.)   49 in    Assembled Height (in.)  28 in 
   Assembled Width (in.)   42 in    Built-in HEPA filter    No 
   Built-in carbon filter  No    Certifications and Listings   3-UL Classified 
   Color    Cool Sand   Color Family   Beige / Cream 
   Commercial / Residential   Commercial / Residential   Cooling zone (sq. ft.)  1650 
   Discharge direction  Side  Evaporative Cooler Product Type  Roof/Wall Cooler 
   Horsepower (hp)   .75 hp   Manufacturer Warranty   Limited lifetime warranty on wet section/5-yr limited warranty on media/2-yr warranty on motor and pump/1-yr limited warranty on parts 
   Motor Included    Yes   Number of Speed Settings   2 
   Product Depth (in.)  49    Product Height (in.)    28 
   Product Weight (lb.)    197   Product Width (in.)  42 
   Returnable  90-Day   Single or dual inlet    Single inlet 
   Voltage (volts)   115"},

   {name: "HDX 30 in. Pedestal Fan", 
   image: "Fan1",
   price: "149.00",
   description: "
   The HDX 30 in. pedestal fan's motor powers 3 aluminum fan blades to provide economical cooling and air circulation for all environments including warehouses, factories, offices, garages and more. These portable fans have a 360 degree pivot-action head that allows vertical airflow adjustments and a tool free hand screw knob for height adjustments.
   3 adjustable speeds for your comfort
   Powerful motor for large air volume
   Aluminum fan blades for maximum air movement
   360 degree adjustable tilt
   Height adjustment from 5-1/4 ft. to 6 ft.
   Steel housing for added durability
   Commercial-grade pedestal fan ideal for use in warehouses, factories and other indoor work areas
   Easy assembly
   Indoor use only
   UL listed
   Fan Type : Pedestal Fan
   Specifications: 
   Adjustable Height    Yes   Assembled Depth (in.)   27 in 
   Assembled Height (in.)  72 in    Assembled Width (in.)   34 in 
   Assembly Required    Yes   Certifications and Listings   1-UL Listed 
   Color Family   Black    Cord Length (ft.)    6.55 
   Fan diameter (in.)   30    Grounded    Yes 
   Indoor/Outdoor    Indoor   Ionizing    No 
   Manufacturer Warranty   1 year   Mounting style    Standalone 
   Oscillating    Yes   Product Depth (in.)  34 
   Product Height (in.)    27    Product Weight (lb.)    41.06 
   Product Width (in.)  72    Remote Control    No 
   Returnable  90-Day   Slip-resistant feet  Yes 
   Thermostat  No    Timer    No"},

   {name: "Dyna-Glo 50K - 200K LP Convection Heater", 
   image: "Heater1",
   price: "139.00",
   description: "
   The Dyna-Glo 200,000 BTU Portable Convection Tower Propane Heater features 3 heat settings and a 360-degree heat radius that offers plenty of warmth for areas of up to 4,700 sq. ft. The convenient, one-hand piezo ignition helps provide a fast startup, while the non-slip base and automatic shutoff help ensure safety.

   Variable heat settings can produce 50,000, 120,000 and 200,000 BTU/hr. to keep you warm and comfortable
   Heats up to 4,700 sq. ft., with a 360-degree heat radius for ample coverage
   One-hand piezo ignition helps provide quick and easy startup
   Automatic shutoff and sturdy, non-slip base help ensure safe use
   CSA listed for safety
   Auto safety shut-off and large sturdy base to prevent tipping
   Note: Product may vary by store
   Specifications: 
   Accessories Included    No    Area Heated (Sq. Ft.)   4700 
   Assembled Depth (in.)   15.91 in    Assembled Height (in.)  26.18 in 
   Assembled Width (in.)   15.91 in    Automatic shutoff    Yes 
   Certifications and Listings   ANSI Certified,CSA Listed  Color    Silver 
   Color Family   Metallics   Digital Display   No 
   Fuel Gauge  No    Fuel rate (gallons/hour)   0 
   Fuel tank capacity (gallons)  0  Heat rating (BTU/hour)  200000 
   Heater Type    Other    Heating Product Type    Gas Portable Heater 
   Heating Technology Type    Convection  Ignition Type  Piezo 
   Indoor/Outdoor    Indoor/Outdoor    Manufacturer Warranty   Limited one year 
   Material    Steel    Nonslip base   Yes 
   Power/Fuel Type   Propane  Product Depth (in.)  15.91 
   Product Height (in.)    26.18    Product Weight (lb.)    13.2 
   Product Width (in.)  15.91    Remote Control    No 
   Returnable  45-Day   Run time (hours)  11 
   Thermostat  No    Timer Included    No 
   # Vented   No    Wheels   No"},


   {name: "Kirkland Signature Roast Beef in Beef Broth 12oz 24-pack", 
   image: "Can1",
   price: "79.99",
   description: " 
   Kirkland Signature Roast Beef in Beef Broth is a convenient way to prepare your favorite recipes such as Mexican dishes, stir-fry, soups, and casseroles. Made with premium grass fed beef to ensure that the finished product is very lean and tender.  At 97% lean, this blend of premium top and bottom round beef is a fully cooked and shelf stable product for up to 2 years.  This beef has the flavor, quality, and value expected in all Kirkland Signature items.
   Premium Top and Bottom Round Beef
   97% Fat Free / Only 80 calories per serving
   Gluten Free
   Product of the USA
   Certified by the American Heart Association
   Fully cooked, ready to eat
   24ct. / 12oz cans
   4 Servings Per Can
   Serving Size: 2oz (56g)
   96 Total Servings
   $3.34 per ca"},

   {name: "Harvest Creek Roast Beef with Gravy 12oz 24-pack", 
   image: "Can2",
   price: "64.99",
   description: "
   Harvest Creek Roast Beef with Gravy is a quick and easy way to make any meal great.  Made with premium beef and a savory brown gravy this product is a quick and easy meal solution for any dinner table, simply heat and serve. As a fully cooked shelf stable product, this beef with gravy offers a convenient meal on its own or simply add vegetables for a tasty beef stew. Other recipe ideas include hot roast beef sandwiches or served with mash potatoes, rice, or pasta noodles.   
   Quality Beef Product
   Gluten Free
   Product of USA
   Fully cooked, ready to eat
   Shelf stable for up to 2 years
   24ct. / 12oz cans
   2 Servings Per Can
   Serving Size: 2/3 cup (151g)
   48 Total Servings
   $2.71 per ca"},

   {name: "Sustainable Fields San Marzano Red Tomatoes, 14 oz- 6 Pack", 
   image: "Can3",
   price: "29.99",
   description: "
   In the foothills of Mount Vesuvius is a land rich in organic substances and minerals that when combined with the nearby Mediterranean Sea, provide some of the best soil in the entire country of Italy. This soil is where San Marzano tomatoes thrive, giving chefs the best sauce tomatoes in the world.  Compared to the more common Roma (plum) tomatoes, the San Marzano have thicker flesh, fewer seeds and a stronger, less sweet and acidic taste - bittersweet, like great chocolate.  This bright red tomato, whose name denotes both its origin and variety, is harvested only by hand due to its delicate nature.  The San Marzano is picked, peeled and packed from August through September, sometimes later.  So prized are they, that in 1996, San Marzano tomatoes were granted Protected Designation of Origin status by the European Union and only cans that display the DOP designation are guaranteed to be genuine San Marzano tomatoes.
   84 oz. total weight
   21 total servings
   Serving size: 1/2 cup (4oz)
   DOP Product of Ital"},

   {name: "30,144 Total Servings 4-Person 1-Year Food Storage", 
   image: "Food1",
   price: "3999.99",
   description: "
   Now is the time to take advantage of this incredible value! Our most extensive THRIVE emergency food supply yet, the Emergency Cube provides over 30,000 total servings of long-lasting freeze dried and dehydrated THRIVE foods enough to sustain up to 4 people for 1 year in any circumstance!

   Be prepared with the convenience of delicious foods that are simple to prepare in situations without electricity or fresh ingredients just add water to rehydrate them in minutes! With quick recipes on every can and our exclusive THRIVE cookbook included, you can create healthy, well-balanced meals for your family under any conditions. Order this comprehensive food supply today to get the peace of mind provided only by the superior quality of THRIVE foods!

   This deluxe supply includes great-tasting foods from each of the THRIVE categories, grains, fruits, veggies, meats and beans, dairy, baking essentials, drinks, and even dessertensuring that you have the necessary variety and nutrition. As with all Shelf Reliance products, THRIVE foods are selected and tested to meet the highest standards of premium, long-lasting quality. Great taste and simple preparation make this THRIVE package perfect for creating healthy, delicious meals in any emergency situation!
    
   Comprehensive food supply for up to 12 months for 4 people  
   Shipment arrives on a pallet that is black-wrapped for security and privacy  
   Pallet contains 63 separate boxes  
   All freeze dried foods have a shelf life of up to 25 years

   Simple rehydration instructions, recipes, and helpful tips are included on each can. 

   This kit contains 378 #10 cans of the following THRIVE foods:

   Grains:
   42 Hard White Winter Wheat (25 year shelf life) (Country of Origin: USA)
   36 White Rice (25 year shelf life) (Country of Origin:  USA)
   14 Pearled Barley (8 year shelf life) (Country of Origin:  USA)
   10 Whole Wheat Flour (5 year shelf life) (Country of Origin:  USA)   
   10 White Flour (5 year shelf life) (Country of Origin:  USA)   
   8 Quick Oats (25 year shelf life) (Country of Origin:  USA)   
   8 Cornmeal (5 year shelf life) (Country of Origin:  USA)  
   8 Elbow Macaroni (8 year shelf life) (Country of Origin:  USA)

   Fruits & Veggies:
   20 Potato Chunks (25 year shelf life) (Country of Origin:  USA)  
   12 Sweet Corn FD (25 year shelf life) (Country of Origin:  USA)   
   8 Broccoli FD (25 year shelf life) (Country of Origin:  USA)   
   4 Carrot Dices (8 year shelf life) (Country of Origin:  USA/Poland)   
   2 Banana Slices FD (25 year shelf life) (Country of Origin:  Ecuador)
   6 Strawberries FD (25 year shelf life) (Country of Origin:  USA)   
   8 Green Peas FD (25 year shelf life) (Country of Origin:  USA)  
   4 Raspberries FD (25 year shelf life) (Country of Origin:  USA/Chile/Serbia)
   10 Apple Slices (25 year shelf life) (Country of Origin:  USA)   
   4 Onions FD (25 year shelf life) (Country of Origin:  USA)

   Dairy:
   36 Powder Milk (25 year shelf life) (Country of Origin:  USA)   
   6 Cheese Blend (15 year shelf life) (Country of Origin:  USA)   
   6 Chocolate Drink Mix (25 year shelf life) (Country of Origin:  USA)

   Protein:
   6 Whole Egg Powder (3 year shelf life) (Country of Origin:  USA)   
   8 Chicken TVP (10 year shelf life) (Country of Origin:  USA)  
   14 Pinto Beans (25 year shelf life) (Country of Origin:  USA/Canada)  
   12 Black Beans (25 year shelf life) (Country of Origin:  USA/Canada)
   4 Sausage TVP (10 year shelf life) (Country of Origin:  USA)  
   4 Ham TVP (10 year shelf life) (Country of Origin:  USA)   
   8 Lentils (25 year shelf life) (Country of Origin:  USA)   
   8 Beef TVP (10 year shelf life) (Country of Origin:  USA)   
   6 Taco TVP (10 year shelf life) (Country of Origin:  USA)

   Misc:
   2 Iodized Salt (25 year shelf life) (Country of Origin:  USA)   
   2 Chicken Bouillon (5 year shelf life) (Country of Origin:  USA)   
   6 Brown Sugar (10 year shelf life) (Country of Origin:  USA)   
   6 Fudge Brownies (20 year shelf life) (Country of Origin:  USA)  
   2 Baking Powder (25 year shelf life) (Country of Origin:  USA)   
   2 Beef Bouillon (5 year shelf life) (Country of Origin:  USA)   
   10 White Sugar (25 year shelf life) (Country of Origin:  USA)  
   6 Orchard Apple Drink (3 year shelf life (Country of Origin:  USA)  
   6 Orange Bliss Drink (3 year shelf life) (Country of Origin:  USA)
   4 Simply Peach Drink (3 year shelf life) (Country of Origin:  USA"},

   {name: "Food, Fire, Filter 72 hour Emergency Supply Pallet 80 units.", 
   image: "Food2",
   price: "4799.99",
   description: " 
   The Food Fire Filter 72-Hour Pallet provides 80 total buckets, each containing the food, fire starters and water filtration needed to help 2 people survive for 72-hours. Each kit contains 76 servings of delicious meals that will not only fill, they will satisfy. Thats 12 servings per day (1526 calories) per person for 3 days, making the combined total of this pallet equal to 6,080 servings (or 732,480 total calories).

   In addition, each Food Fire Filter Kit includes the supplies needed to cook and prepare your food, including a portable barbeque grill, a high-quality stainless steel pot, multi-purpose utensils, waterproof matches and InstaFirea safe, natural fire starter. 

   Each Food Fire Filter 72-Hour Kit contains:
   1 pouch Oatmeal (10 servings)
   1 pouch Granola  (10 servings)
   1 pouch Multigrain Cereal (10 servings)
   1 pouch Instant Milk (8 servings)
   1 pouch Instant Orange Drink (8 servings)
   2 pouches Potato Chowder (10 servings)
   2 pouches Creamy Tomato Soup (10 servings)
   2 pouches Creamy Vegetable Rice (10 servings)
   9 pouches InstaFire Fire Starter
   1 box Waterproof Matches  
   1 Portable Cooking Stove**
   1 2-quart Stainless Steel Pot
   1 Filter Water Bottle - The Advanced filter removes up to 99.99% of chlorine, chemicals, and heavy metals; and up to 99.9999% of bacteria and virus using its proprietary Ionic Adsorption Micron Filtration System.
   2 8oz. Cups
   2 Folding Multipurpose Utensils

   Other Features:
   Nutritional and preparation information
   Just add water
   Quick and easy to prepare
   A good source of protein every day
   No hydrogenated oils, trans fats or added MSG
   Up to 20-year shelf life.*
   Date of manufacturing printed on each mylar pouch
   Date of manufacturing on the outside of the bucket
   Ships in discreet packaging
   Net Weight:  770 lbs
   Pallet Dimensions:  42\"W x 49\"L x 70\" H

   Our companys name, Food for Health International, reflects our commitment of providing food that promotes optimal health, increased longevity and a sustained quality of life. 

   * Shelf life: Up to 20-years from date of manufacture. For best taste and nutritional value, store between 60F and 70F.

   **Folding Barbecue Frame; Open Size: 9-1/2\" X 9-1/2\" X 4-1/2\"; Folded Size: 9-1/2\" X 9-1/2\" X 3/8\"; 4 Pc 4-3/4\" Removable Legs; 1 Pc 9-3/4\" X 10\" X 19/64\" Grill Top; Total Weight of Grill : 0.75 LB"},
]

products.each do |product_attrs|
   image = product_attrs[:image].to_s + '.jpg'
   product_attrs.delete(:image)
   product = Spree::Product.create!(product_attrs.merge(defaults))
   product.taxons << Spree::Taxon.offset(rand(Spree::Taxon.count)).first
   if(!image.nil? && image != '.jpg')
      #product.images.create(:attachment => File.open(File.join(Rails.root, "db", "seeds", "marketplace_pics", image)))
   end
   product.save
end


groupgrants = [
   {
      image: "animals1",
      name: "Homeless From Birth",
      description: "Every year, thousands of household pets are abandoned at birth because their owners don't want them or can't afford them. These neglected pets need a place to call home, especially at such a vulnerable time of their lives. They need inoculations and the right food for proper growth. Help us give these pets a home by providing the funds needed for inoculations."
   },{
      image: "animals2",
      name: "Wild Animals Need Help",
      description: "There are many wild animals living in urban areas nowadays. It is hard for these animals to survive in areas where people have built roads, traps and other hazards for wild animals. These animals become injured and have no way to recover because food supply and shelter is limited. Please help fund our groupGrant to raise funds for medical care for wild animals."
   },{
      image: "animals3",
      name: "Keep Them Around",
      description: "Help the Pensacola Pound keep strays alive by providing funds for just one animal! The cost for feeding one stray is about $5.00 a day. Your donation can help keep just one stray around long enough to find another home."
   },{
      image: "beanie",
      name: "Warm a Head",
      description: "Children in Ukraine are in need of warm clothes for the winter this year. We hand knit beanies for children in poorer areas that have no way of being warm enough for a hard winter ahead. Help us raise money for the materials needed to make and ship these beanies. ($2 per beanie)"
   },{
      image: "clothes1",
      name: "Hand-Me-Down To Needy",
      description: "We have gathered as many articles of clothing as possible to help clothe the backs of many people who have lost their clothes in the recent disaster in Sri Lanka. We still need to purchase a shipping container and pay for the shipping costs overseas. Please help!"
   },{
      image: "disaster1",
      name: "Rebuild a Town",
      description: "The town of Asahi in Japan was hit hard by the recent earthquake and tsunami. Help us raise funds needed to rebuild this town from the ground up so people can recover as quickly as possible."
   },{
      image: "disaster2",
      name: "Homeless",
      description: "The Barns family is now homeless as a result of the recent tornado that came and destroyed their home. Help us rebuild a house for this family of nine by contributing to this groupGrant!"
   },{
      image: "farm",
      name: "Growing For Life",
      description: "Help us teach the people of Mozambique to learn sustainable farming. If we can teach them to farm, they can learn to support themselves and grow as a community. Donate to this groupGrant to help give supplies and farming products to these people."
   },{
      image: "food1",
      name: "To the Starving",
      description: "Help us feed those who can't feed themselves by donating to this groupGrant. Your proceeds will go towards purchasing basic food staples that will feed as many mouths as possible."
   },{
      image: "food3",
      name: "Dallas Thanksgiving Project",
      description: "There are many homeless veterans in the Dallas area. We want to show them that people still care about them. Help us by donating towards food for this upcoming event!"
   },{
      image: "hearing",
      name: "Just Like Jared",
      description: "Help other kids like Jared be able to hear again. Donate to help pay for the much needed medical equipment for making it possible for many kids to combat hearing disabilities."
   },{
      image: "india",
      name: "Teaching English",
      description: "Help Jon get to India to teach kids in the Mumbai area to speak English."
   },{
      image: "kids",
      name: "Soccer-Cadets",
      description: "These kids aren't playing just for fun. They play to help bring the same opportunity to kids their age in Africa. Donate now to help these kids spread opportunities around the world."
   },{
      image: "medical1",
      name: "Vaccinate Sudad",
      description: "Kids in Sudan need vaccinations for tetnis, measles and other diseases. Help us provide the medical equipment to make a project life this possible."
   },{
      image: "medical2",
      name: "Guide-Dogs",
      description: "Marissa has just gotten the chance to have a guide dog. Help others just like her to have the same opportunity to gain their freedom again!"
   }
]

# Adding Mission Run groupGrant
def missions_run_default
   {
      goal_date: 1.month.from_now,
      is_enabled: true,
      is_complete: false,
      goal_amount: rand_goal_amount,
      charity: Charity.find_by_name("Bearing Precious Seed"),
      groupgrant_category:  GroupgrantCategory.find_by_name("Missions"),
      partner_id: 0
   }
end

midnight_run =[
   image: "missionsrun",
   name:"Mission Midnight Run", 
   description:"The PCC Student Body presents the Missions midnight run, in order to support the work of Bearing Precious Seed! This year, BPS is trying to raise support to help spread Bibles to Nepal, Romania, Sierra Leone, and Thailand. Please pray that they are able to raise enough support and join us on April 25 for the midnight run! You don't want to miss this!"
]


midnight_run.each do |groupgrant_attrs|
   image = groupgrant_attrs[:image].to_s + '.jpg'
   groupgrant_attrs.delete(:image)

   
   if(!image.nil? && image != '.jpg')
      #add_pic = {groupgrant_pic: File.open(File.join(Rails.root, "db", "seeds", "groupgrant_pics", image))}
      #groupgrant_attrs.merge!(add_pic)
   end
   groupgrant = Groupgrant.create!(groupgrant_attrs.merge(missions_run_default))

   groupgrant.goal_status = groupgrant.goal_amount * rand_percentage
   groupgrant.save
end




def group_defaults 
   {
      goal_date: 1.month.from_now,
      is_enabled: true,
      is_complete: false,
      goal_amount: rand_goal_amount,
      charity: Charity.offset(rand(Charity.count)).first,
      groupgrant_category:  GroupgrantCategory.offset(rand(GroupgrantCategory.count)).first,
	  partner_id: 0
   }
end

groupgrants.each do |groupgrant_attrs|
   image = groupgrant_attrs[:image].to_s + '.jpg'
   groupgrant_attrs.delete(:image)

   # commeted
   if(!image.nil? && image != '.jpg')
     #add_pic = {groupgrant_pic: File.open(File.join(Rails.root, "db", "seeds", "groupgrant_pics", image))}
     #groupgrant_attrs.merge!(add_pic)
   end
   
   groupgrant = Groupgrant.create!(groupgrant_attrs.merge(group_defaults))

   groupgrant.goal_status = groupgrant.goal_amount * rand_percentage
   groupgrant.save
end
 

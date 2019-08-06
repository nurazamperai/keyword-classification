// file: AllOrgs+TU_ICNPO+newcat_by-activity
// created: 17/4/2019
// by: NAP, STATA 15
// revision: 30/5/2019, 11/6/2019


**/------------------------------------------------------------------------\**

* based on newcat_ver2_20190214 - this ver correct 'rotary' back to 1300!

* assign orgs by ACTIVITY regardless of beneficiary

* only 1 phase process - identify activity --> assign to ICNPO

* new cats 2500 (alumni, PTA etc) 7400 (ethnic orgs) 10200 (burial)

* refinement based on beneficiary will be undertaken for stage 2 analysis = to determine ethnic/relig distribution/composition of orgs
* stage 2 = 'activity' identifies appropriate ICNPO group, ie 'what(it does)' but beneficiary refines the activity by identifying 'for whom'.
* reason why we want to know for whom is based on literature, D&P notes that orgs are based on 'blood, believer & brother, ch 3 origins points to ethnicity and religion being at the core of associational life. therefore we want to see if data agrees.


* the follwing from ver 2 & 1
* 14/2 - changes from ver1 = removal of 'persatuan ketua' from 7100 and inserting 'ketua kamp' into 11100

* the following lines form ver. 1
* 2500 + 10200 included as per ver.13

* shortcoming / limitation of keyword based allocation is due to the sheer number of organisations, impossible for a single researcher to identify all possible keywords, or go through each and every organisation therefore there will be organisations that will be assigned to the wrong icnpo code or not assigned to any (i.e. 12100) 


**/------------------------------------------------------------------------\**

clear
use C:\Users\nbp1\Desktop\ALLORGS-ICNPO\AllOrgs+TU_clean-unsorted_20190411.dta


* as per ICNPO plus 2500 7400 & 10200
* 6200 no orgs qualify

local icnpo = "1100 1200 1300 2100 2200 2300 2400 2500 3100 3200 3300 3400 4100 4200 4300 5100 5200 6100 6200 6300 7100 7200 7300 7400 8100 9100 10100 10200 11100 12100"


* Group 1 - Organisations and activities in general and specialized fields of culture and recreation

* 1100 culture and arts
* anything with  only 'kebudayaan' and/or 'kesenian' and/or related words (eg. warisan) denote it promotes or engages in cultural activities
* kebudayaan + kebajkan -> 1300

local keyword1100 = `" "anak seni" "angkatan seni" " art society" "arts and" " arts society" "arts theatre company" "badan kebudayaan" "badan kesenian" "chemor public library" "chingay" "chopin" "christian dance federation" "cultural centre" "dance theatre" "dikir barat" "dondang sayang" "drama " "dramatic" "filharmonik" "heritage society" "kaligraf" "kelab fotograf" "kelab kebudayaan dan kesenian" "kesenian dan kebudayaan" "kelab kesenian" "kelab kesusasteraan" "kelab muzik" "kelab nyanyian" "kelab pancaragam" "kelab seni budaya" "kelab seni lukis" "kelab tarian" "kinta tin mining" "kompang" "kugiran" "kumpulan bangsawan" "kumpulan kebudayaan" "line dance" "literary association" "majlis kebudayaan" "memorial muzium" "musical party" "music society" "musical association" "musical society" "muzium warisan" "ngajat" "nightingale melodians" "on theatre" "opera cina" "penang arts council" "penggiat kesenian" "penggiat seni" "penggiat zapin" "pengurusan muzium" "penyajak" "perbadanan kesenian" "performing arts centre" "persatuan animasi" "persatuan bahasa" "persatuan bangsawan" "persatuan derama" "persatuan drama" "persatuan fotografi" "persatuan gendang" "persatuan kebudayaan" "persatuan kebudayaan dan kesenian" "persatuan kemajuan pengucapan awam" "persatuan kesenian" "persatuan kesusasteraan" "persatuan lembaga adat" "persatuan muzik" "persatuan muzium" "persatuan nyanyian" "persatuan opera " "orkestra" "persatuan pengucapan awam" "persatuan perfileman" "persatuan pelukis" "persatuan pembaca" "persatuan penari" "persatuan penulis" "persatuan perpustakaan" "persatuan puisi" "persatuan pusat sumber" "persatuan sejarah" "persatuan senibudaya" "persatuan senipurba" "persatuan seni budaya" "persatuan seni dan" "persatuan senifoto" "persatuan seni kebudayaan" "persatuan seni khat" "persatuan seni kr" "persatuan seni lukis" "persatuan senilukis" "persatuan seni opera" "persatuan seni pentas" "persatuan seni sa" "persatuan seni suara" "persatuan seni tari" "persatuan seni tulis" "persatuan tarian" "persatuan teater" "persatuan teman nyanyian" "persatuan warisan budaya" "persatuan warisan" "pertubuhan bangsawan" "pertubuhan fotograf" "pertubuhan ghazal " "pertubuhan kebudayaan dan kesenian" "pertubuhan kesenian" "pertubuhan muzik" "pertubuhan nyanyian" "pertubuhan senifoto" "pertubuhan seni foto" "pertubuhan seni tari" "pertubuhan teater" "pertubuhan tarian" "pertubuhan warisan" "philharmonic" "photographic association" "photographic society" "poet" "pusat nyanyian" "rakan muzium" "rakan nyanyian" "reading room" "royal asiatic society" "sahabat muzium" "seni bud" "seni warisan" "teater" "theatre group" "warna warni" "wayang kulit" "yamata" "zoological" "'

* to replace the following into 1100;
* "persatuan kebudayaan dan kesenian" 

* 1200 sports
* provision of amateur sport, training, physical fitness, and sport competition services and events; includes fitness and wellness centers.
* organisations with a 'sport' in the name = promotes/organises/offers sporting activity
* all SCO orgs by deafault are 1200
* all orgs with 'sports name' = 1200

local keyword1200 = `" "airsoft" "aquatic" "archery club" "asian pga" "athletic association" "athletic club" "baseball club" "basketball" "budi suci" "capoeira" "cycling club" "dancesport" "deaf sports confederation" "divers club" "ekuin" "equestrian club" "equestrian kelantan" "equine club" "football club" "futsal club" "futvoli" "gayung fatani" "gimrama" "go kart" "goju" "gymnastic" "hash house" "iaido" "indra seni silat" "inline" "jetski" "jitsu" "jodo " "jombola" "kabaddi" "karom" "kawalan jauh" "kayak" "kebudayaan jasmani" "kelab aero " "kelab aikido" "kelab akuatik" "kelab angkat berat" "kelab badminton" "kelab berbasikal" "kelab billiard" "kelab bina badan" "kelab bola" "kelab boling" "kelab catur" "kelab dart" "kelab dodgeball" "kelab drift" "kelab ekuestrian" "kelab equestrian" "kelab floorball" "kelab futsal" "kelab gimnas" "kelab golf" "kelab gusti" "kelab hoki" "kelab judo" "kelab kabbadi" "kelab kanu" "kelab kenu" "kelab kriket" "kelab larian" "kelab layar piasau" "kelab lumba" "kelab marathon" "kelab memanah" "kelab menembak" "kelab menyumpit" "kelab motor lasak" "kelab motorcross" "kelab motorsport" "kelab mountain bike" "kelab muay" "kelab olahraga" "kelab payung terjun" "kelab pemain golf" "kelab pencak silat" "kelab ping" "kelab polo" "kelab ragbi" "kelab rahman putra" "kelab renang" "kelab senaman" "kelab silat" "kelab seni bela" "kelab seni silat" "kelab skuasy" "kelab snooker" "kelab snuker" "kelab sofbol" "kelab pendaki" "kelab sepak" "kelab sukan bank" "kelab sukan behn" "kelab sukan bermotor" "kelab sukan great" "kelab sukan hanson" "kelab sukan hasil" "kelab sukan hsbc" "kelab sukan imigresen" "kelab sukan jabatan" "kelab sukan jkr" "kelab sukan kakitangan" "kelab sukan keretapi" "kelab sukan komuniti" "kelab sukan ktm" "kelab sukan kumpulan" "kelab sukan lasak" "kelab sukan lembaga" "kelab sukan majlis" "kelab sukan malay" "kelab sukan mapa" "kelab sukan olahraga" "kelab sukan pejabat" "kelab sukan pekerja" "kelab sukan peniaga" "kelab sukan penjara" "kelab sukan perbadanan" "kelab sukan permotoran" "kelab sukan perubatan" "kelab sukan pos" "kelab sukan risda" "kelab sukan silat" "kelab sukan sin" "kelab sukan snooker" "kelab sukan sri" "kelab sukan sta" "kelab sukan tarian" "kelab taek" "kelab tenis" "kelab tenpin" "kempo" "kendo" "kesatuan ragbi" "kick boxing" "kickboxing" "kuoshu" "ladies bridge club" "latihan jasmani" "lawn bowls" "lawn tennis" "majlis paralimpik" "martial art" "meluncur ais" "mendayung" "minibike" "motocross" "motorsports club" "mountain bike club" "mountaineering federation" "offroad " "olimpik" "olympics" "pacuan empat roda" "papan selaju" "pasukan hoki" "pelayaran" "pemanah" "penembak" "pendidikan jasmani" "pentathlon" "perguruan seni silat" "persatuan adithada" "persatuan aikido" "persatuan aikikai" "persatuan akuatik" "persatuan angkat berat" "persatuan basikal" "persatuan badminton" "persatuan berbasikal" "persatuan berkuda" "persatuan besbol" "persatuan billiard" "persatuan bina badan" "persatuan boccia" "persatuan bola" "persatuan boling" "persatuan bowling" "persatuan bulu tangkis" "persatuan catur" "persatuan chenshi" "persatuan chin woo" "persatuan chun kuhn do" "persatuan dart" "persatuan dodgeball" "persatuan dunia seni silat" "persatuan eku" "persatuan floorball" "persatuan futsal" "persatuan gasing" "persatuan gimnastik" "persatuan golf" "persatuan gusti" "persatuan hoki" "persatuan j.robik" "persatuan jasmani" "persatuan judo" "persatuan kebudayaan jasmani" "persatuan kabbadi" "persatuan kanu" "karate" "persatuan kecergasan" "persatuan kenu" "persatuan kriket" "persatuan kung fu" "persatuan lompat tali" "persatuan lumba" "persatuan lawan pedang" "persatuan lawn" "persatuan luncur" "persatuan marathon" "persatuan memanah" "persatuan mendaki" "persatuan menembak" "persatuan muay" "persatuan olahraga" "persatuan olimpik" "persatuan paralimpik" "persatuan para tenpin" "persatuan payung terjun" "persatuan pencak silat" "persatuan pendaki" "persatuan pemotoran" "persatuan permotoran" "persatuan perahu" "persatuan pesaka" "persatuan ping" "persatuan polo" "persatuan ragbi" "persatuan renang" "persatuan sambo " "persatuan scrabble" "persatuan seni mempertahankan" "persatuan seni silat" "persatuan sepaktakraw" "persatuan sepak takraw" "persatuan senaman" "persatuan shenlong taichi" "persatuan silat" "persatuan skuasy" "persatuan squash" "persatuan sofbol" "persatuan sukan aeronautik" "persatuan sukan air" "persatuan sukan bermotor" "persatuan sukan boksing" "persatuan sukan chin woo" "persatuan sukan ek" "persatuan sukan elektronik" "persatuan sukan extreme" "persatuan sukan dan muay thai" "persatuan sukan kanu" "persatuan sukan kecergasan" "persatuan sukan layar" "persatuan sukan lengan" "persatuan sukan long" "persatuan sukan lumba" "persatuan sukan orang" "paintball" "persatuan sukan tarian" "persatuan taekwon" "persatuan tai chi" "persatuan taic" "persatuan taiji" "persatuan taipu" "persatuan tenpin" "persatuan xiangqi" "persekutuan badminton" "persekutuan besbol" "persekutuan bola" "persekutuan catur" "persekutuan dodgeball" "persekutuan gishi" "persekutuan kung fu" "persekutuan sepak" "persekutuan silat" "persekutuan sukan" "persekutuan taek" "pertubuhan bola" "pertubuhan penunggang" "pertubuhan seni silat" "pertubuhan silat seni" "persatuan tenis" "petanque" "polo club" "powerlifting" "qi gong" "qigong" "racing association" "rugby club" "running club" " scuba " "senamrobik" "seni mempertahankan diri" "seni pertahanan diri" "silambam" "skateboard" "snooker" "snuker" "sports club" "soccer" "softball club" "sukan air" "sukan akuatik" "sukan drift" "sukan ekstrem" "sukan elektronik" "sukan kenu" "sukan larian" "sukan lumba" "sukan motor" "swimming club" "taekw" "taijiquan" "tang soo do" "tarik tali" "tarung derajat" "tchoukball" "tennis" "tern yun" "tinju" "tomoi" "triathlon" "turf club" "volleyball" "wakeboard" "wellness centre" "wellness club" "wiser sport" "woodball" "wushu" "xiang qi" "yacht club" "'
  
** to ensure all sports assoc captured, after all assigned - (replace incpo1200 if strpos regulator, "sco") - make note in methods ch. 


* 1300 other recreation and social clubs
local keyword1300 = `" " 4x4 " "alpha hospitality" " alza " "alzarian" "badan kebajikan dan sukan" "bikers club" "bmw" "bukit jambul club" "country club" "dan rekreasi" "dan riadah" "dan sosial" "hilux" "inner wheel" "johor sikhs sports club" "kebudayaan dan sukan" "kelab anggota" "kelab apex" "kelab audit" "kelab auto" "kelab basikal" "kelab berkereta" "kelab bermotor" "kelab bermotosikal" "kelab diraja" "kelab dublin estate" "kelab elantra" "kelab honda" "kelab hospital" "kelab imigresen" "kelab institut" "kelab jabatan" "kelab jasin" "kelab ipoh diraja" "kelab karaoke" "kelab kebajikan bank rakyat" "kelab kebajikan dan riadah" "kelab kebajikan dan sosial" "kelab kebajikan dan sukan" "kelab kebajikan rekreasi" "kelab kebajikan sukan dan" "kelab kecergasan" "kelab kedah diraja" "kelab kinabalu sabah" "kelab kebajikan jabatan" "kelab keluarga jabatan" "kelab keluarga koperasi belia" "kelab kementerian" "kelab kereta" "kelab kilat" "kelab kiwanis" "kelab komputer internet" "kelab kumpulan motorsikal" "kelab lembaga" "kelab lions" "kelab majlis" "kelab melaka" "kelab memancing" "kelab motor " "kelab motorsikal" "kelab motosikal" "kelab muhibbah" "kelab nissan" "kelab orang gunung" "kelab pekerja" "kelab pemancing" "kelab pemilik" "kelab peminat" "kelab penerbangan" "kelab penunggang" "kelab penyokong" "kelab permotoran" "kelab perodua" "kelab peugeot" "kelab polis" "kelab porsche" "kelab proton" "kelab radio" "kelab rekreasi" "kelab riadah" "kelab risda" "kelab rtm" "kelab skuter" "kelab sokanjaya" "kelab sosial" "kelab stm" "kelab sukan dan explorasi" "kelab sukan dan hiburan" "kelab sukan dan kebajikan" "kelab sukan dan kebudayaan" "kelab sukan dan sosial" "kelab sukan kebajikan" "kelab sukan kebudayaan" "kelab sukan keselamatan dan kebajikan" "kelab sukan riadah" "kelab sukan rekreasi" "kelab sukan sosial" "kelab sultan sulaiman" "kelab taman perdana diraja" "kelab telekom" "kelab tm" "kelab toyota" "kilat club" "lancer" "lions club" "livina" "majlis kebajikan dan sukan" "majlis sukan jabatan" "majlis sukan kebajikan" "maserati" "mercedes" "myvi" "persatuan anggerik" "persatuan automobil" "persatuan bonsai" "persatuan kebajikan dan sosial" "persatuan kebajikan dan sukan" "persatuan kebajikan jabatan" "persatuan kebudayaan dan kebajikan" "dan sukan" "persatuan kebudayaan pendidikan dan sukan masyarakat india" "persatuan memancing" "persatuan pemilik kereta" "persatuan pemilik moto" "persatuan pemilik nissan" "persatuan persahabatan" "persatuan orkid" "persatuan peminat" "persatuan pencinta" "persatuan penggemar" "persatuan rekreasi" "persatuan riadah" "persatuan sosial" "persatuan sukan dan keb" "persatuan sukan dan sosial" "persatuan sukan keb" "persatuan sukan rekreasi" "pertubuhan kebajikan dan sosial" "pertubuhan kebajikan dan sukan" "pertubuhan kebajikan sosial" "pertubuhan komuniti" "pertubuhan motosikal" "pertubuhan peminat" "pertubuhan persahabatan" "pertubuhan rekreasi" "pertubuhan sosial dan kebajikan" "radio ama" "recreation club" "recreational club" "rekreasi dan" "remote control" "rotaract" "rotary" "royal automobile club" "sahabat riadah" "scubacops" "social club" "sokanjaya" "sokan dan kebajikan" "sosial dan sukan" "sukan dan kebajikan" "sukan dan sosial" "the beaufort club" "the penang club" "the raintree" "wajaclub" "volkswagen" "zonta" "'

* issues - "pertubuhan komuniti" - some are eth/relig, residents, welfare (amal) - non social or recreational

//-----------------------------------------------------------------\\

* Group 2 - Organizations and activities administering, providing, promoting, conducting, supporting and servicing education and research.

* 2100 pre-sch, primary, secondary [complete]
local keyword2100 = `" "akademi pendidikan irsyad" "al ehya asshariff" "and educational association" "alice smith" "bukit bintang education" "expatriate school" "heng ee school" "hope learening center" "keat hwa private school"  "hwa chinese school foundation" "korean education" "lembaga pengurus sekolah"  "pendidikan staffield" "pendidikan al irsyad" "private school management" "pusat pendidikan al" "pusat pendidikan as" "pusat pendidikan hidayah" "pusat pendidikan ikhwan" "pay fong school" "pengurusan sekolah" "private school management" "rengit bhd" "sekolah persendirian sin min" "sekolah rendah sathya" "semoa" "tribal education" "yayasan gemumi" "yayasan sekolah menengah chong hwa kuantan" "yong peng high school" "' 

* 2200 HE [complete]
local keyword2200 = `" "centre for education" "commonwealth university of malaysia" "fatimah college of nursing" "german malaysian institute" "higher education in malaysia" "international islamic university malaysia" "isles internationale universite" "kolej islam malaya" "kolej teknologi islam melaka" "kolej universiti selatan" "kuisas" "merdeka university" "razak school of government" "yayasan putra business school" "yaysan unimap" "zong higher learning centre" "'

* 2300 other education inc. vocational, adult [complete]
local keyword2300 = `" "asian institute of finance" "awlu malaysia" "carmel communication" "chartered secretaries" "ibfim" "iclif" "institut memandu" "learning centre" "permanent way" "pusat latihan perubatan" "seacen" "sekolah memandu" "the outward bound trust of malaysia" "toastmaster" "yayasan kebajikan perlis" "'

* 2400 research [complete]
local keyword2400 = `" "advancement of cultures research" "cancer research malaysia" "centre for genomics technology" "economic research and analysis" "institut fizik" "institut kajian" "institut pemikiran kreatif malaysia" "institut penyelidikan kanser makna" "institut penyelidikan pendidikan dan pembangunan melayu" "malaysian institute of economic research" "national institute of occupational safety and health" "persatuan penyelidik rimba" "persatuan penyelidikan" "persatuan produksi haiwan malaysia" "persatuan sains" "persatuan teknologi" "pertubuhan kajian seni" "pertubuhan penyelidikan" "research and development" "research centre" "research institute" "research malaysia" "sarawak development institute" "strategic studies institute" "tropical research" "yaysan amir" "'

* 2500 as per Smith 1996 - students service, alumni, PTA
local keyword2500 = `" "alumni" "alumnae" "badan kebajikan pelajar" "bekas graduan" "bekas mahasisw" "bekas murid" "bekas pelajar" "bekas penuntut" "ex pupils" "ex students" "gabungan pelajar" "graduates association" "ibubapa dan guru" "kelab mahasiswa" "kelab pelajar" "kemajuan pelajar" "majlis perwakilan pelajar" "mantan pelajar" "minda pelajar" "murid lama" "murid tua" "old boys association" "old clifford" "old frees" "old georgians" "old girls association" "old michaelian" "old pupils association" "old putera" "old students association" "old thomian" "old xavier" "old xaverian" "past pupils association" "penuntut tua" "persatuan alumnus" "persatuan graduan" "persatuan ibubapa dan pendidik" "persatuan ibubapa guru" "persatuan ibubapa pelajar" "persatuan ibubapa taska" "persatuan kebajikan pelajar" "persatuan mahasisw" "persatuan kebajikan masyarakat bekas pelajar" "persatuan siswa" "persatuan x smtt" "pertubuhan mahasiswa" "pertubuhan pelajar" "satuan pelajar" "siswa siswi" "school parents association" "siswazah" "siswi" "students association" "'



//-------------------------------------------------------------------\\

* 3100 hospitals [complete]
local keyword3100 = `" "adventist hospital" "assunta hospital" "national eye hospital" "hospitals beyond boundaries" "hospital lam wah ee" "hospital tung shin" "hospital fatimah" "mount miriam" "'

*3200 nursing homes [complete] 
local keyword3200 = `" "hospis" "hospice" "home for the infirm and aged" "jagaan orang tua" "jagaan warga" "lions nursing home" "paliatif" "palliative" "pemeliharaan hayat" "rumah kebajikan orang orang tua" "rumah kebajikan warga emas" "rumah orang orang tua" "rumah warga tua" "rumah warga emas" "sitiawan healthcare association" "'

*3 300 Mental Health and Crisis Intervention [complete]
local keyword3300 = `" "badan kebajikan psikiatri" "befrienders" "kebajikan mental" "kebajikan psikiatri" "kesihatan jiwa" " mental health" "persatuan kesihatan mental" "persatuan kesihatan minda" "pesakit mental" "psychiatric" "sokongan kesihatan minda" "'

* 3 400 Other Health Services - wellness educ, outpatient clinics, rehab, nature cure, yoga, physical therapy, ambulance, paramedic
local keyword3400 = `" "adolescent health" "aman kanser" "anti kanser" "anti tuberculosis" "asthma club" "badan kebajikan thalas" " barah " "cancerlink" "cardio pulmonari" "childhood cancer" "chi kung health association" "chlorella health association" "diabetes" "diabetic care" "diabetic society" "dialysis centre" "epilepsi" "family health association" "family planning association" "haemodialysis centre" " heart association" "hemodialisis" "kelab kanser" "kelab thalas" "kesihatan keluarga" "majlis kanser nasional" "marga yoga" "membasmikan hepatitis" "paramedik" "parkinson" "pemulihan kanser" "penang health association" "pencegahan tuberkulosis" "penyakit tidak berjangkit" "perkhidmatan ambulan" "perkhidmatan haemodialisis" "persatuan bagi mencegah penyakit" "persatuan buah pinggang" "persatuan demensia" "persatuan haemodial" "persatuan kanser" "persatuan kebajikan haemodialisis" "persatuan kebajikan kanser " "persatuan kebajikan pesakit" "persatuan kesihatan reproduktif" "persatuan longevitolog" "persatuan mencegah penyakit" "persatuan pencegahan penyakit" "persatuan penghidap kanser" "persatuan perancangan keluarga" "persatuan penyakit" "persatuan rawatan buah pinggang" "persatuan resusitasi" "persatuan sokongan penyakit alzheimer" "persatuan terapi muzik" "persatuan thalas" "persatuan yoga" "pertubuhan dimensia" "pertubuhan haemodial" "pertubuhan hemodialysis" "pertubuhan kanser" "pertubuhan thalas" "pertubuhan yoga" "perubatan ayurveda" "perubatan dan pesakit ayurveda" "pesakit buah pinggang" "prevention of tuberculosis" "public health association" "pusat dial" "pusat yoga" "rare disorders" "renal centre" "rumah sehat kanser" "sahabat kanak kanak kanser" "saringan kanser" "sokongan kanser" "st johns ambulans" "zero tb world" "'


//---------------------------------------------------------------------\\

* 4100 Social Services - child, youth (not youth clubs), family services,handicap, elderly (ex nursing homes - 3200), self help, social services, conselling
* after 'ywca' are keywords from 4300
local keyword4100 = `" "agensi kaunseling" "aids support group" "anak miskin" "anak yatim" "asperger development" "autis" "badan sokongan" "bagi orang cacat" "bagi orang orang cacat" "banner of love" "breast cancer survivors" "cac childrens home" "cerebral palsy" "charis foundation" "cheshire" "cleft lip and palate" "dan sokongan" "down syndrom" "for the blind" "ibu tunggal" "jagaan orang kurang upaya" "jagaan orang orang kurang upaya" "kanak kanak cacat" "kanak kanak istimewa" "kanak kanak terencat akal" "kebajikan orang orang cacat" "kebajikan orang buta" "kebajikan warga emas" "kelab kecacatan fizikal" "kelab sokongan" "kelab warga emas" "kelab wargatua" "kumpulan sokongan" "majlis kebajikan masyarakat" "membantu kanak kanak" "next frontier" "orang dengan kecacatan" "orang kurang upaya" "pencegahan kanser" "pergerakan puteri islam malaysia" "perkhidmatan kaunseling" "persatuan bagi orang orang cacat" "persatuan ibu tunggal" "persatuan kebajikan anak anak istimewa" "persatuan kebajikan dan pembangunan masyarakat" "persatuan kebajikan kanak kanak" "persatuan kebajikan orang orang tua" "persatuan kebajikan orang tua" "persatuan kaunseling" "persatuan kebajikan kanak kanak kurang upaya" "persatuan kebajikan komuniti" "persatuan kebajikan masyarakat" "persatuan kebajikan orang cacat" "persatuan kebajikan orang kurang upaya" "persatuan kebajikan orang orang kurang upaya" "persatuan kebajikan untuk orang cacat" "persatuan kebajikan pekak" "persatuan kebajikan warga emas" "persatuan kebajikan warga mas" "persatuan kebajikan warga tua" "persatuan komuniti orang kurang" "persatuan kumpulan sokongan" "berida" "persatuan orang buta" "persatuan orang cacat" "persatuan orang orang cacat" "persatuan orang orang pekak" "persatuan orang kelainan" "persatuan orang kurang" "persatuan orang kurang upaya" "persatuan orang pekak" "persatuan orang yang amat cacat" "persatuan penyayang warga emas" "persatuan pembangunan sokongan" "persatuan pemulihan orang" "persatuan penjagaan kanak kanak terencat" "persatuan perihatin" "persatuan prihatin" "persatuan sahabat faqeh" "persatuan sindrom" "persatuan sokongan" "persatuan untuk orang orang pekak" "persatuan warga emas" "persatuan wargatua" "persekutuan orang pekak" "pertubuhan kaunseling" "pertubuhan kebajikan dan pendidikan" "pertubuhan kebajikan kanak" "pertubuhan kebajikan keluarga" "pertubuhan kebajikan komuniti" "pertubuhan kebajikan masyarakat" "pertubuhan kebajikan orang" "pertubuhan kebajikan orang kurang upaya" "pertubuhan kebajikan pendidikan" "pertubuhan misi untuk kanak kanak" "pertubuhan orang buta" "pertubuhan orang cacat" "pertubuhan orang kurang upaya" "pertubuhan orang orang kurang upaya" "pertubuhan orang pekak" "pertubuhan perkhidmatan sokongan" "pertubuhan prihatin" "pertubuhan sokongan" "potensi cads" "pusat harian kanak kanak spastik" "pusat jagaan" "pusat kaunseling" "rakan sokongan" "rumah anak" "rumah kanak kanak" "rumah penyayang" "society for the deaf" "sokongan aids" "sokongan anak" "sokongan autisme" "sokongan awal" "sokongan kaum ibu" "sokongan komuniti" "sokongan masyarakat" "sokongan pesakit" "special needs support group" "support association" "the blind" "yayasan chow kit" "young mens christian association" "young womens christian association" "'


* replace 'persatuan pengusaha' to 11100

* 4200 Emergency and Relief - disaster management, temporary shelters, refugee
local keyword4200 = `" "aafaq for education" "asylum access" "badan amal kebajikan dan bencana" "bantuan bencana" "bertindak bencana" "bomba dan penyelamat sukarela" "bomba gotong royong" "bomba sukarela" "disaster rescue" "gerakan bencana" "pasukan bomba sukarela" "pasukan bomba rakyat sukarela" "pengurangan risiko bencana" "pengurusan bencana" "penyelam sukarelawan" "penyelamat sukarela" "persatuan bantuan" "persatuan bencana alam" "persatuan bomba" "persatuan pasukan bomba sukarela" "perubatan kecemasan" "pelarian" "pertubuhan bantuan kemanusiaan" "pertubuhan bomba sukarela" "rescue disasters" "sukarela bomba" "sukarelawan penyelamat kecemasan" "yayasan najima" "'

local keyword4300 = `" " ai xin" "amazing love hope" "anyone in need" "badan amal" "badan kebajikan am" "bantu orang susah" "bantuan kemanusiaan" "benevolent society" "charity organisation" "dapur rakyat" "food aid" "food basket" "food for life" "gelandangan" "kebajikan amal" "kebajikan keluarga miskin" "kebajikan orang orang miskin" "kebajikan rakyat miskin" "kelaparan" "masyarakat miskin" "persatuan amal" "persatuan kebajikan am" "persatuan kebajikan kemiskinan" "persatuan kebajikan metta" "persatuan melmaruvathur adhiparasakthi" "persatuan kebajikan ren ai" "pertubuhan amal" "persatuan membantu orang" "persatuan untuk membantu orang" "pertubuhan membantu" "pertubuhan saling membantu" "rakyat miskin" "soup kitchen" "swastika" "tabung amal" "tabung makanan" "'


//-----------------------------------------------------------------------\\

* Group 5 - Organizations promoting and providing services in environmental conservation, pollution control and prevention, environmental education and health, and animal protection.

* 5100 environment  [complete]
local keyword5100 = `" "alam sekitar bumi hijau" "batu caves protection association" "biodiversity conservation" "cintai alam dan sungai" "cintai alam sekitar" "cintai sungai" "conservancy" "ekonomi alam sekitar" "environmental management society" "forum air" "free tree society" "green ranger" "jaringan bersatu alam sekitar" "kebun botanik" "kebajikan dan alam sekitar" "keharmonian alam sekitar" "kelab alam sekitar" "kelab biodiversiti" "kesedaran alam sekitar" "kitar semula dan alam sekitar" "mengawasi alam sekitar" "menjaga alam" "nature conservation" "nature society" "oceanlife" "pemelihara terumbu" "pemuliharaan alam sekitar" "pencinta air terjun" "pencinta alam" "pencinta flora dan fauna" "pencinta sungai" "pengawasan alam sekitar " "penjagaan alam" "pelindung alam" "penyayang alam sekitar" "penyelamat sungai" "perikatan alam sekitar" "perlidungan tumbuh tumbuhan" "perlindungan alam " "persatuan akuhijau" "persatuan alam sekitar" "persatuan alam" "persatuan ekologi malaysia" "persatuan kesihatan environmen" "persatuan konservasi alam" "pertubuhan alam sekitar" "pertubuhan biodiversiti" "prihatin alam sekitar" "rainforest conservation" "wetlands conservation" "rakan alam" "sahabat alam" "sahabat bukit " "sahabat hutan" "sahabat rimba" "save earth" "save the earth" "sayangi alam" "sejagat dan alam sekitar" "sisa dan alam sekitar" "tindakan alam sekitar" "warisan alam sekitar" "yayasan alam kekal" "'

* 5200 animal protection [complete]
local keyword5200 = `" "aktivis haiwan" " anjing " "bear conservation" "binatang terbiar" "borneo rhino" "cintai haiwan" "cruelty to animals" "elephant foundation for starvation" "friends of the orangutans" "haiwan jalanan" "haiwan kesayangan" "haiwan terbiar" "haiwan terbuang" "hak haiwan" "hidupan penyu" "kebajikan haiwan" "kekejaman terhadap haiwan" "kelab pencinta haiwan" "konservasi kuda laut" "kucing terbiar" "pelindung haiwan" "pembiakan haiwan peliharaan" "pemeliharaan dan penjagaan haiwan" "pemuliharaan penyu" "pemuliharaan hidupan liar" "pelindung haiwan"  "pencinta arnab" "pencinta burung" "pencinta hidupan laut" "pencinta kucing" "pencinta unggas" "penganiyaan haiwan" "pengasih haiwan" "penyayang haiwan" "pencegah penyeksaan haiwan" "pencinta haiwan" "penjagaan haiwan" "penyayang haiwan" "perlindungan haiwan" "perlindungan dan peliharaan haiwan" "penyelamat haiwan" "penyelamatan haiwan" "persatuan menolong haiwan" "persatuan pencinta haiwan" "persatuan penyokong kawalan pembiakan haiwan" "persatuan spca" "pertubuhan perlindungan hidupan liar" "projek penyu" "santuari haiwan" "shark savers" "stray" "society for the prevention of cruelty to animals" "tabung makanan haiwan" "tindakan haiwan" "wildlife" "world wide fund for nature malaysia" "yayasan perlindungan hidupan liar" "yayasan pulau orang utan" "'

* replace 'persatuan pencegahan penganiayaan haiwan' 'persatuan pencegahan kekejaman terhadap haiwan' 'persatuan pencegahan dan penganiyaan haiwan' to 5200

//-----------------------------------------------------------------------\\

* 6100 economic, social and community development [complete]
* residents associations are included under 'community and neighbuorhood organizations'
* two types of residents association = 1) 'open' ie with no ethnic/religious exclusivity & 2) RA caters to specific ethnic or relig group. 
* RA 'open' = 6100
* RA 'ethnic/relig' 2 = 7100

local keyword6100 = `" "amanah ikhtiar malaysia" "badan kebajikan masyarakat kampung" "badan penduduk" "home owners" "homeowners" "kebajikan penduduk" "kejiranan" "keluarga dan penduduk" "komuniti ambangan heights" "komuniti desa" "komuniti kampung" "komuniti penduduk" "komuniti taman" "membasmi kemiskinan" "paya rumput perdana" "pemilik bangunan" "pemilik dan penghuni" "pemilik taman" "penduduk taman" "penghuni rumah pangsa" "perhubungan penduduk taman" "permuafakatan penduduk" "persatuan jawatankuasa penduduk" "persatuan kebajikan masyarakat kampung" "persatuan kebajikan pemilik rumah" "persatuan kebajikan penduduk" "persatuan kejiranan" "persatuan komuniti blok" "persatuan komuniti fasa" "persatuan komuniti lorong" "persatuan komuniti seksyen" "persatuan komuniti ss" "persatuan komuniti taman" "persatuan masyarakat kampung" "persatuan muhibbah penduduk" "persatuan muhibah penduduk" "persatuan pembangunan ekonomi" "persatuan pembasmi kemiskinan" "persatuan pemilik apartmen" "persatuan pemilik banglo" "persatuan pemilik dan penduduk" "persatuan pemilik flat" "pemilik kondominium" "persatuan pemilik pangsapuri" "persatuan pemilik rumah" "pertubuhan pemilik unit kondominium" "persatuan pemilik vil" "persatuan penduduk" "persatuan penghuni" "persatuan perumahan" "persatuan suara penduduk" "pertubuhan masyarakat kampung" "kelab penduduk" "persatuan kemasyarakatan penduduk" "persatuan komuniti dan penduduk" "penduduk pangsapuri" "persatuan perpaduan penduduk" "persatuan kebajikan dan keselamatan penduduk" "pertubuhah penduduk" "persatuan sepakat penduduk" "persatuan keselamatan penduduk" "persatuan keharmornian penduduk" "persatuan rakan penduduk" "persatuan pakatan penduduk" "persatuan kemajuan penduduk" "pertubuhan pemuafakatan penduduk" "persatuan perpaduan antara penduduk" "pertubuhan keselamatan penduduk" "penduduk bandar country" "persatuan kebajikan dan pendidikan penduduk" "persatuan kebajikan dan kebudayaan penduduk" "kelab perpaduan penduduk" "persatuan tahsin penduduk" "persatuan bertindak penduduk" "badan kebajikan dan keselamatan penduduk" "badan kebajikan dan penduduk" "persatuan kebajikan dan kemasyarakatan penduduk" "persatuan perhubungan penduduk" "pertubuhan perhubungan penduduk" "prihatin dan penyayang penduduk" "persatuan pemilik pembeli dan penduduk" "pertubuhan pembangunan usahawan" "pertubuhan pemilik dan penduduk" "pertubuhan penduduk" "pertubuhan penghuni" "resident association" "residents association" "sosial penduduk" "tenants association" "'

* 6300 Employment and Training, career counseling
local keyword6300 = `" "association of learning and development" "pembangunan sumber manusia bhd" "persatuan pembangunan kemahiran" "persatuan pembangunan usahawan" "pertubuhan pembangunan kemahiran" "pertubuhan pendidikan dan pembangunan kemahiran" "pusat kemahiran" "pusat pembangunan kemahiran" "skills development centre" "' 
* old keywds "student placement" "latihan" "vocational" "'

//-------------------------------------------------------------------------\\

* for 7100 first 'group' = advocacy, civil rights & civic assoc; 2nd group from 'artis india' onwards = ethnic based org
* last section = orgs with chinese names
local keyword7100 = `" "advokasi" "andarsi" "angkatan belia" "anti aedes" "anti dadah" "anti denggi" "anti merokok" "anti nyamuk" "anti perjudian" "badan kebajikan peneroka" "bekas guru" "bekas kakitangan" "bekas pegawai" "bekas pekerja" "bekas pemain" "bekas pengakap" "bantuan kanak kanak" "child information learning and development centre" "gerakan belia" "gerakan belia 4b" "gerakan integrasi belia" "hak asasi" "home ex children association" "institute for democracy" "internaional movement for a just world" "kebajikan bekas tentera" "kelab bell belia tamil" "kelab bell tamil" "junior chamber" "kesedaran sivil" "kelab anak muda" "kelab belia" "kelab kebajikan wanita" "kelab kebersihan" "kelab pemuda" "kelab pesara" "kelab rakan muda" "kelab sokongan penyusuan" "kelab suara" "kelab veteran" "kelab wanita" "komuniti belia" "majlis ayahanda" "majlis belia" "majlis kebajikan kanak" "majlis keselamatan jalan" "pendidikan kanak kanak mabul" "peneroka felda" "pergerakan pemuda" "persatuan aktivis" "persatuan aliran kesedaran negara" "persatuan anak" "persatuan angkatan be" "persatuan angkatan generasi" "persatuan bapa" "persatuan belia" "persatuan gerak wanita" "persatuan hal ehwal wanita" "persatuan isteri" "persatuan kaum ibu" "persatuan kaum wanita" "persatuan kebajikan dan pendidikan wanita" "persatuan kebajikan dan pembangunan wanita" "persatuan kebajikan isteri" "persatuan kebajikan wanita" "persatuan kemajuan dan kebajikan wanita" "persatuan kemajuan wanita" "persatuan kebersihan" "persatuan khidmat" "persatuan mantan j" "persatuan mantan pegawai" "persatuan mantan pemuda" "persatuan mencegah obesiti" "persatuan pembangunan dan kebajikan wanita" "persatuan pembangunan wanita" "persatuan pemud" "persatuan pencegahan" "persatuan pendidikan" "persatuan pesara" "persatuan suri" "persatuan wanita" "persatuan warga" "persatuan veteran" "pertubuhan belia" "pertubuhan gerakan belia" "pertubuhan isteri" "pertubuhan kebajikan dan kemajuan wanita" "pertubuhan kebajikan dan pembangunan wanita" "pertubuhan kebajikan wanita" "pertubuhan kebajikan warga" "pertubuhan kebersihan" "pertubuhan khidmat" "pertubuhan pembangunan wanita" "pertubuhan pemuda" "pertubuhan peneroka" "pertubuhan pergerakan keadilan" "pertubuhan penggerak generasi muda" "pertubuhan perikemanu" "pertubuhan pemakanan sihat" "pertubuhan veteran tentera" "pertubuhan wanita" "pertubuhan warga" "road safety" "sokongan pendidikan awal" "susu ibu" "taman didikan kanak kanak" "vegetarian" "womens action" "yayasan hijau" "young womens association of ipoh" "youth association" "youth club" "youth entrepreneur society" "youth leadership club" "youth organisation" "youth society" "'


* 7200 legal services, crime prevention and public safety, rehabilitation of offenders, victim support, consumer protection associations [complete]
local keyword7200 = `" "anti jenayah" "barisan pengguna" "bekas pengguna dadah" "bekas penghuni penjara" "cegah jenayah" "discharge prisoners aid" "discharged prisoners aid" "discharged prisoners society" "dispute resolution center" "jawatankuasa pemulihan dadah" "kebajikan pengguna" "kelab pengguna" "keperihatinan jenayah" "kesedaran jenayah" "keselamatan komuniti" "keselamatan sukarela" "komuniti kepolisan" "lembaga pembangunan pengguna" "motor insurers bureau" "perlindungan hak" "pembasmian jenayah" "pencegahan jenayah" "persatuan gerakan pengguna" "persatuan kebajikan pengguna" "persatuan kepolisan" "persatuan keselamatan pengguna" "persatuan keselamatan sukarela" "persatuan mencegah dadah" "persatuan membantu bekas banduan" "persatuan membantu bekas bekas banduan" "persatuan membantu orang orang dalam penyeliaan" "persatuan pelanggan perkhidmatan kewangan" "persatuan pelindung pengguna" "persatuan penasihat pengguna" "persatuan penggerak pengguna" "persatuan perlindungan pengguna" "persatuan pemulihan bekas bekas banduan" "persatuan penasihat pengguna" "persatuan pengguna" "persatuan rakan keamanan" "persatuan rangkaian pengguna" "persatuan undang undang" "pertubuhan kesedaran pengguna" "pertubuhan kepolisan" "pertubuhan pembangunan pengguna" "pertubuhan pengguna" "pertubuhan perisikan pengguna" "pertubuhan suara pengguna" "public safety" "rakan pendokong bekas penagih" "'

* replace "pertubuhan komuniti kepolisan" to 7200


* 7300 Political Organizations [complete]
local keyword7300 = `" "parti " "party " "indian congress" "ceylonese congress" "barisan nasional" "united pasokmomogun kadazandusun murut " "alliance for justice of peace" "united sabah national organisation" "pertubuhan perpaduan rakyat kebangsaan sabah" "pertubuhan kebangsaan melayu bersatu" "indian progressive front" "kelab penyokong barisan nasional" "kelab sukarelawan muda barisan nasional" "kelab ketuanan barisan nasional" "pewaris kerajaan barisan nasional" "sosial kebangsaan barisan nasional" "wakil rakyat" "kelab umno" "kelab suara umno" "kelab veteran umno" "kelab alumni pidato piala presiden umno" "'


* ethnic/religious (non-ritual) groups
local keyword7400 = `" "an banjar " "anak dayak" "aspirasi dayak" "adi dravida" "ban ning" "besai dayak" "buddhist monk" "buddhist social welfare" "buddhist youth" "chinese concern" "christian counsellors" "christian folowers society" "christian leaders society" "christian musicians" "christian tamil" "christian welfare" "hee han club" "hu seong club" "kannada devangar" "kheng kiow club" "khew seong kok club" "kim lian club" "kiung chiao club" "koong yee club" "lan teng kok club" "lei yong club" "leong yew club" "lok lum club" "mor hun club" "mun ngah club" "nyap jee club"  "catholic business fraternity" "catholic pharmacists association" "catholic women" "ceylon association" "ceylonese" "chew association" "chinese assembly hall" "chinese association" "chinese benevolent society" "chinese club" "chinese maternity" "chinese union" "christian pastors association" "chow association" "chua clan" "clan association" "clans association" "clansmen association" "dewan perhimpunan cina" "dangsanak" "dravidian" "ekonomi india" "ekonomi melayu" "ekonomi wanita dan ibu tunggal india" "eng choon association" "faedah bersama ch" "faedah bersama cina" "faedah bersama fee" "faedah bersama foochow" "faedah bersama fui" "faedah bersama hainan" "faedah bersama hopoh" "faedah bersama islam" "faedah bersama johor kong" "faedah bersama kaum" "faedah bersama ngee" "faedah bersama orang orang india" "faedah bersama soon" "faedah bersama syn" "faedah bersama thong yin" "faedah bersama tung" "foochow association" "g kongsi" "gagasan melayu" "gan association" "guan club" "guangxi association" "gujarati samaj" "h kongsi" "hainan association" "hakka association" "hakka community association" "hindu employees society" "hin aun association" "hoay kuan" "hoey kuan" "hockien association" "hock kean" "hokian benevolent association" "hokkien association" "hokkien kongsi" "hui ann association" "imam hindu" "indian association" "indian muslim association" "indian sanmarka" "ka yin" "kadayanallur muslim association" "kalavirthy ceylon tamil" "kaum cina" "kaum india" "kebajikan mual" "kelab dayak" "kelab foochow" "kelab hokkien" "kelab india" "kelab kheng" "kelab khuan onn" "kelab melayu" "kelab toh guan" "kerala semajam" "kesetiaan melayu" "kheh community" "khoo kongsi" "kochow association" "komuniti bajau" "komuniti bidayuh" "komuniti bongawan" "komuniti bugis" "komuniti hakka" "komuniti hindu" "komuniti india" "komuniti islam" "komuniti irish" "komuniti jawa" "komuniti kaum" "komuniti korea" "komuniti kristian" "komuniti masyarakat bajau" "komuniti melanau" "komuniti muslim" "komuniti pakistan" "komuniti sikh" "komuniti somalia" "komuniti yemen" "kongres kebangsaan dayak" "kongsi ann" "kongsi ch" "kongsi khoo" "kongsi lim" "ku kong chow" "kwang tung association" "kwangtung association" "kwongsai association" "lim kongsi" "majlis penasihat sikh" "masyarakat india" "masyarakat melayu" "membantu ibu kaum" "mukkulathor" "mukkulator" "paderi hindu" "paderi kristian" "pakistani league" "pembasmian kemiskinan tegar india" "pergerakan kebangsaan sikh" "perhimpunan tiong hua" "perpaduan kaum hindu" "persatuan ahli keluarga" "persatuan aik " "persatuan ann" "persatuan anxi" "persatuan bangsa " "persatuan bengalee" "persatuan bumiputera" "persatuan ceylon" "persatuan cha" "persatuan chen" "persatuan chia" "persatuan china " "persatuan chin " "persatuan ching " "persatuan chong" "persatuan choong" "persatuan chui" "persatuan chu ch" "persatuan chuk" "persatuan chulia" "persatuan chung" "persatuan cina" "persatuan dayak" "persatuan eng choon" "persatuan eurasian" "persatuan foo" "persatuan fui ch" "persatuan fui tung onn" "persatuan gabungan kaum" "persatuan gagasan dayak" "persatuan guangxi" "persatuan gujarati" "persatuan hainan" "persatuan hai " "persatuan hakka" "persatuan heng ann" "persatuan hew" "persatuan hindraf" "persatuan hok san" "persatuan hoon" "persatuan hock" "persatuan hokkien" "persatuan hokkian" "persatuan hopo" "persatuan huang" "persatuan hui" "persatuan iban" "persatuan india" "persatuan hopoh" "persatuan hwee ann" "persatuan kadayan" "persatuan kaum" "persatuan kaum keturunan" "persatuan kaying" "persatuan kebajikan cina" "persatuan kebajikan masyarakat cina" "persatuan kebajikan dan kebudayaan telugu" "persatuan kebajikan hokkien" "persatuan kebajikan india" "persatuan kebajikan intergrasi komuniti india" "persatuan kah yin" "persatuan kayan" "persatuan kebajikan kaum" "persatuan kebajikan keluarga" "persatuan kebajikan keturunan" "persatuan kebajikan kimlan" "persatuan kebajikan komuniti india" "persatuan kebajikan masyarakat bajau" "persatuan kebajikan masyarakat bidayuh" "persatuan kebajikan masyarakat bongawan" "persatuan kebajikan masyarakat cina" "persatuan kebajikan masyarakat dayak" "persatuan kebajikan masyarakat islam" "persatuan kebajikan masyarakat kaum" "persatuaan kebajikan masyarakat sikh" "persatuan kebajikan masyarakat tiong" "persatuan kebajikan melayu" "persatuan kebajikan orang orang cina" "persatuan kebajikan perubatan sikh" "persatuan kebajikan sikh" "persatuan kebajikan tamilar" "persatuan kebajikan tuai rumah" "persatuan kebajikan udayar" "persatuan kebajikan wanita india" "persatuan kebajikan wanita melayu" "persatuan kebajikan dan kebudayaan india" "persatuan kebajikan dan kebudayaan kaum" "persatuan kebangsaan dayak" "persatuan kebangsaan orang ulu" "persatuan kebangsaan sea dayak" "persatuan keluarga" "persatuan kemajuan india" "persatuan keturunan" "persatuan khoo" "persatuan kien" "persatuan kin cho" "kinmen" "persatuan klan " "persatuan kochow" "persatuan koh" "persatuan komuniti india" "persatuan kwang" "persatuan kwantung" "persatuan kwong" "persatuan lam " "persatuan lee " "persatuan leo" "persatuan lim " "persatuan liong" "persatuan lok" "persatuan longchuan" "persatuan long say" "persatuan lung" "persatuan masyarakat cina" "persatuan masyarakat leung" "persatuan malayal" "persatuan masyarakat hakka" "persatuan masyarakat kaying" "persatuan masyarakat kwong" "persatuan melanau" "persatuan melayu" "persatuan nam " "persatuan nan " "persatuan orang asli" "persatuan orang orang cina" "persatuan orang ulu" "persatuan kebajikan hopoh" "persatuan kebajikan orang orang india" "persatuan kebajikan orang orang islam" "persatuan kebajikan penganut" "persatuan kebajikan yee aik" "persatuan masyarakat kampar" "persatuan peh" "persatuan pembangunan dayak" "persatuan peranakan cina" "persatuan persaudaraan dayak" "persatuan pembangunan sikh" "persatuan persaudaraan melayu" "persatuan sinhala" "persatuan rungus" "persatuan serakup iban dayak" "persatuan suku kaum" "persatuan tamil" "persatuan teo" "persatuan thiru" "persatuan tian" "persatuan tiong" "persatuan toh" "persatuan tong " "persatuan wanita cina" "persatuan wanita india" "persatuan wanita melayu" "persatuan wanning" "persatuan waris dan keturunan" "persatuan warisan keluarga" "persatuan wu " "persatuan wui" "persatuan yee" "persatuan yeoh" "persatuan zhong" "persekutuan jawa" "persekutuan majlis melayu" "persekutuan melayu" "pertubuhan bao" "pertubuhan cina" "pertubuhan hakka" "pertubuhan hock" "pertubuhan india" "pertubuhan kadazan" "pertubuhan kebajikan anak melayu" "pertubuhan kebajikan bumiputera" "pertubuhan kebajikan cina" "pertubuhan kebajikan dayak" "pertubuhan kebajikan india" "pertubuhan kebajikan dan pembangunan insan india" "pertubuhan kebajikan dan kemajuan india" "pertubuhan kebajikan hakka" "pertubuhan kebajikan masyarakat kaum" "pertubuhan kebajikan masyarakat islam" "pertubuhan kebajikan masyarakat tamilar" "pertubuhan kebajikan masyarakat tiong" "pertubuhan kebajikan melayu" "pertubuhan kebajikan muslim" "pertubuhan keluarga" "pertubuhan kemajuan wanita" "pertubuhan komuniti india" "pertubuhan keturunan" "pertubuhan masyarakat cina" "pertubuhan melayu" "pertubuhan pembangunan insan sikh" "pertubuhan pembangunan kemasyarakatan sikh" "pertubuhan persaudaraan kakitangan kristian" "pertubuhan sosial kaum" "pertubuhan tiong hwa" "pertubuhan transformasi dayak" "poon yu association" "rangbrang sikhs" "sikh entrepreneurs" "sosioekonomi masyarakat kristian" "sosial kebajikan orang cina" "tai poo" "tai pu association" "teo khiaw club" "teochew association" "teochew eight" "toendekand" "usawahan muslim" "wanita sikh" "char yeong association" "cher ser association" "chin kang association" "chiyang association" "chung hua association" "king wan association" "kong soh association" "li chee association" "mee tor association" "san kiang association" "shing an association" "sien sia association" "sing tong association" "the lee association" "toi sun association" "tsen lung fui" "wee leng association" "cheng hwa club" "cheng wah club" "chung nyien club" "nam kiew club" "seong club" "siang yee club" "sung kheow club" "wah hin club" "yat lum club" "kelab hoo thian" "kelab khiew onn" "kelab kong yue" "kwangtung hwai kuan" "persatuan chiow ann" "persatuan fui tong" "persatuan guangdong" "persatuan hang kang" "persatuan hing ann" "persatuan hua sang" "persatuan hung kung" "persatuan jin hoe" "persatuan kang har" "persatuan kebajikan yong nga" "persatuan lui chew" "persatuan lung yen" "persatuan pinang tonhiong" "persatuan see tee" "persatuan shew yit" "persatuan siew heng" "persatuan sun wui" "persatuan sze y" "persatuan tan si" "persatuan thoong nyien" "persatuan t'oo nyap" "persatuan vui neng" "pertubuhan anak melayu" "pertubuhan toh tong" "pertubuhan wing onn" "tan kongsi" "hooi kuan" "woo koon" "wooi koon" "wui koon" "wui kuon" "wui kun" "yew association" "'

//----------------------------------------------------------------------\\

* 8100 Philanthropic Intermediaries and Voluntarism Promotion - grantmaking, fund-raising, volunteering promotion
local keyword8100 = `" "academy foundation" "angkatan sukarelawan" "board of trustees" "cancer fund" "foundation" "gabungan sukarelawan" "kelab kebajikan dan sukarelawan" "kelab kebajikan sukarelawan" "kelab sukarelawan" "komuniti kesukarelawan" "komuniti sukarelawan" "life line" "persatuan kebajikan sukarelawan" "persatuan pengajian yuan man" "persatuan kumpulan sukarelawan" "persatuan sukarela" "pertubuhan kebajikan sukarelawan" "pertubuhan sukarela" "scholarship fund" "skuad sukarelawan" "soroptimist" "sukarelawan untuk keamanan" "tabung amanah" "tabong pelajaran biasiswa" "tabung pendidikan" "tabung pesakit jantung" "the community chest" "trust" "trustees of" "yayasan" "tzu chi foundation" "'

*look for 'yayasan/foundation' dupcodes>1 and reassign


//----------------------------------------------------------------------\\

* International Activities
local keyword9100 = `" "aman palestin" "cakna palestin" "cinta syria" "for syria" " gaza " "humanitarian care malaysia" "islamic relief" "kurnia for hope" "malaysian relief agency" "persatuan bantuan perubatan malaysia" "pertubuhan misi kemanusiaan antarabangsa" "raleigh international" "salam iraq" "syria care" "viva palestina" "world vision malaysia" "'

//-------------------------------------------------------------------------\\

* for 10100 1st 'grp' = relig, 2nd 'grp' from 'khairat kematian' onwards = burial/funeral
* temples at the bottom of list
local keyword10100 = `" "adventist mission" "agama bud" "agama hindu" "agama kristian" "agama tao" "ajaran buddha" "ajaran confuc" "al quran" "alquran" "ancestral temple" "an dewa " "anut dewa " "apostolic church" "ar temple" "arulmigu" "assemblies of god" "ashram" "badan amal baitul quran" "badan islam" "badan kebajikan islam" "baptis" "baptist church" "basic buddhism" "bible presbyterian" "buddha metta" "buddhist association" "buddhist centre" "buddhist chetawan" "buddhist fellowship" "buddhist hermitage" "buddhist ipoh perak" "buddhist kulapati" "buddhist ling san" "buddhist meditation" "buddhist missionary" "buddhist orthodox" "buddhist peak nam" "buddhist rawang selangor" "buddhist sangha" "buddhist society" "buddhist triple" "buddhist vipassana" "budhi" "c hop network" "catholic prison fellowship" "catholic welfare services council" "charis christian" "chettiar temple" "chinese temple" "christian caring fellowship" "christian centre pulau pinang" "christian faith fellowship" "christian fellowsh" "christian prayer fellowship" "christian festival" "christian literature fellowship" "christian love" "christian mission" "christian renewal" "christian revival fellowship" "christian service" "christian worship centre" "church berhad" "church of" "church in penang" "christian assembly" "christian association" "christian fellowship" "christian society" "christian masai" "cocm" "community church" "community excel services" "committee of management" "confucian association" "crusade for christ" "dakwah islam" "dewa sri" "dewi sri" "el shaddai" "elijah" "evangel" "fellowship of buddhists" "fo guang shan" "fund raising committee" "gereja" "gideon" "gospel" "gurdwara" "guru singh sabha" "hal ehwal islam" "hare krishna" "hindu association" "hindu deva" "hindu temple" "holyword church" "irsyad balok" "islamic renaissance front" "istri sat sang" "jawatankuasa pembinaan kuil" "jawatankuasa pengurusan kuil" "jesus christ" "jesus saves" "kitab tradisional hindu" "lembaga zakat selangor" "khalsa" "khuan yin" "koil sri" "kong meng sheng dao" "kong temple" "kristus" "kuil arul" "kuil ayira" "kuil berhala" "kuil bersekutu" "kuil buddha" "kuil cina" "kuil devi" "kuil hindu" "kuil hock" "kuil hong tian" "kuil kampar" "kuil kim ngoh" "kuil leng eng" "kuil sabai" "kuil seen hock" "kuil sithi" "kuil siva subramaniar"  "kuil sree" "kuil sri" "kuil subramania" "kuil tam kung" "kuil thirumurugan" "kuil tsze" "kung men" "kung mung" "kovil" "liga muslim" "light fellowship" "little sisters of the poor" "lodge " "lutheran church" "maahad lil aytam" "malaysia bible seminary" "man temple" "management committee of" "meditasi buddh" "methodist church" "mizan education" "moral uplifting" "mubaligh injil kristian" "muslim jamaath" "muslim league" "muslim society" "nanaksar" "newlife training" "nexgen christian" "pemujaan buddha" "pemuja dewa" "pemujaan dewa" "pendidikan akhlak" "pendidikan buddha" "pengajaran agama" "pengajaran confuc" "pengajaran konfusiunisme" "pengajian buddha" "pengajian konfucius" "pengajian maahad" "penganut agama" "penganut buddha" "penganut dewa" "pengikut buddha" "pengikut dewa" "pengkajian ajaran" "pengurusan maahad" "pengurusan madrasah" "penyokong kuil" "persatuan agama" "persatuan ajaran" "persatuan akademi tahsin quran" "persatuan arul" "persatuan budd" "persatuan confuci" "persatuan dakwah" "persatuan dewa " "persatuan dharma" "persatuan hamlatul quran" "persatuan hindu" "persatuan katholi" "persatuan karma kagyu" "persatuan kebajikan buddh" "persatuan kebajikan islam" "persatuan kebajikan masjid" "persatuan konfusianisma" "persatuan kristian" "persatuan meditasi" "persatuan membaca kitab mencius" "persatuan memperbaiki akhlak" "persatuan meninggikan akhlak" "persatuan menyambut perayaan" "persatuan muslim" "persatuan pembinaan kuil" "persatuan pembinaan rumah berhala" "persatuan pembinaan tokong" "persatuan pemujaan tuhan" "persatuan pengajaran confucius" "persatuan pengajian al quran" "persatuan pengajian agama" "persatuan pengajian confuc" "persatuan pengajian kitab kuning" "persatuan pengamal ajaran" "persatuan penganut" "persatuan pengikut ajaran" "persatuan pengikut pengikut dew" "persatuan pengurusan kuil" "persatuan penyokong ajaran" "persatuan perayaan" "persatuan penyokong perayaan" "persatuan perkembangan pengajian confuc" "persatuan persaudaraan kristian" "persatuan presbyterian" "persatuan sikh" "persatuan tao" "persatuan tokong" "pertubuhan agama" "pertubuhan ajaran agama confuci" "pertubuhan ajaran buddha" "pertubuhan ajaran confuci" "pertubuhan ajaran kristian" "pertubuhan akademi quran" "pertubuhan bible" "pertubuhan buddh" "pertubuhan confuci" "pertubuhan dakwah" "pertubuhan darul quran" "pertubuhan dharma buddhist" "pertubuhan hindu" "pertubuhan islam " "pertubuhan islamicare" "pertubuhan kebajikan islam" "pertubuhan kebajikan kaum" "pertubuhan kebajikan masjid" "pertubuhan kristian" "pertubuhan kuan yin" "pertubuhan kuil" "pertubuhan membina akhlak" "pertubuhan mempertinggi akhlak" "pertubuhan meninggikan akhlak" "pertubuhan menyambut perayaan" "pertubuhan muslim" "pertubuhan pendidikan islam" "pertubuhan pengajian ajaran confucius" "pertubuhan pengajian confuc" "pertubuhan penganut" "pertubuhan pengajian islam" "pertubuhan pengajian tao" "pertubuhan pengikut kuil" "pertubuhan pengkajian bible" "pertubuhan pengurusan kuil" "pertubuhan penyokong perayaan" "pertubuhan perayaan" "pertubuhan persaudaraan kristian" "pertubuhan quran" "pertubuhan sahabat quran" "pertubuhan saiva" "pertubuhan sikh" "pertubuhan tao" "pu ti lian" "pusat meditasi" "rumah berhala" "rumah ibadat" "sai baba" "scripture union" "semangat suci" "sikh temple" "sikh society" "sikh union" "society of archdiocese" "st. andrew" "st francis" "st. joseph's club" "st patrick's society" "syrian church" "tahfiz" "taoism" "temple association" "temple paripalana" "temple restoration society" "thapani temple" "the church at" "the committee of management" "tok kong" "tokong " "tokong kwan" "tua pek kong" "ugama buddha" "ugama hindu" "ugama kung me" "ugama suc" "vihara" " wat " "with a mission" "yaysan al busyraa" "yayasan al hidayah" "yayasan ihg" "beow temple" "biou temple" "cheng sin temple" "ching ser temple" "huah giam temple"  "kung temple" "lian wah temple" "lin yee temple" "ming ang temple" "moey she temple" "nam shi temple" "pak koong temple" "pak kung temple" "poh lam temple" "rajeswary temple" "shirdi sai" "spiritual" "swami" "shin tee temple" "siamese temple" "sian ong temple" "sivan temple" "swamy temple" "sze ja temple" "sze ya temple" "taman s e a temple" "thian miau temple" "thong temple" "thow ngam temple" "tong yap temple" "tong temple" "'

local keyword10200 = `" "bantuan kematian" "bokti mayat" "burial" "cemetary" "cemeteries" "cemetery" "cremation" "death benefit" "funeral" "kebajikan jenazah" "kematian" "kendalian jenazah" "khairat" "perkuburan" "perletakan mayat" "pengebumian" "pengurusan kubur" "persatuan kubur" "rumah mayat" "rumah pembakaran mayat" "urusan jenazah" "'

//----------------------------------------------------------------------\\

* Business and Professional Associations, Unions
local keyword11100 = `" "advertising association" "agricultural association" "arkitek" "association of banks" "association of finance companies" "association of private" "badan kebajikan guru" "badan kebajikan jabatan" "badan kebajikan kakitangan" "badan kebajikan pegawai" "badan kebajikan pekerja" "builders association" "builders club" "business advisory" "business association" "business club" "business council" "business forum" "business innovation" "business network" "bus operators association" "cafe association" "capital markets promotion council" "chamber of commerce" "chartered bankers" "chartered institute of" "chartered loss adjusters" "chartered tax institute" "coffee shop" "college of physicians" "college of surgeons" "cooks association" "dealers association" "dewan perdagangan" "dewan perniagaan" "dewan usahawan" "development finance institution" "dressers association" "electrical association" "employees club" "empunya kereta sewa" "engineering association" "export" "financial advisers association" "financial markets association" "gabungan persatuan peniaga" "gabungan usahawan" "gical society" "goldsmiths association" "gourmet association" "grocers association" "guild" "hairdressers association" "hawkers association" "hoteliers" "import" "industries association" "industry association" "institute of arbitrators" "instructors association" "institute of advanced taxation" "institution of" "iron and steel institute" "jewellers association" "kebajikan nelayan" "kebajikan pengusaha" "kebajikan warga pendidikan" "kebajikan warga perpustakaan" "kelab kakitangan" "kelab kebajikan kakitangan" "kelab kebajikan pegawai" "kelab kebajikan polis" "kelab kebajikan staf" "kelab kebajikan wargakerja" "kelab doktor" "kelab nelayan" "kelab pegawai" "kelab pengusaha" "kelab staf" "kelab usahawan" "kelab veterinar" "ketua kamp" "komuniti usahawan" "kesatuan sekerja" "kongres kesatuan pekerja pekerja oku" "labourers association" "landlord" "lorry owners association" "majlis perdagangan" "majlis perniagaan" "makers association" "malaysian financial planning" "malaysian society of" "manufacturers association" "merchant" "millers association" "mining association" "mongers association" "pemilik kapal" "penyokong tua peh kong" "persatuan agen" "persatuan ajen" "persatuan ahli" "persatuan akademik" "persatuan akauntan" "persatuan anggota" "persatuan artis" "persatuan asrama" "persatuan astro" "persatuan automotif" "persatuan automasi" "persatuan bank" "persatuan bas sekolah" "persatuan chiropractic" "persatuan doktor" "persatuan ejen" "persatuan eksekutif" "persatuan guru" "persatuan homeopati" "persatuan homestay" "persatuan hotel" "persatuan industri" "persatuan insurans am" "persatuan juru" "persatuan kakitangan" "persatuan kardio" "persatuan kaunselor" "persatuan kebajikan guru" "persatuan kebajikan kakitangan" "persatuan kebajikan pegawai" "persatuan kebajikan pekerja" "persatuan kebajikan pemandu" "persatuan pemilik kedai kopi" "persatuan pendandan rambut" "persatuan penerbit" "persatuan pengeluar" "persatuan kebajikan anggota" "persatuan kebajikan peniaga" "persatuan kedai" "persatuan kejuruteraan" "persatuan kereta kereta sewa" "persatuan kilang" "persatuan kontr" "persatuan kotak penangkap" "persatuan nelayan" "persatuan operator" "persatuan obstetrik" "persatuan pajak gadai" "persatuan pakar" "persatuan para pengiklan" "persatuan pedagang" "persatuan pegawai kanan" "persatuan pegawai tadbir" "persatuan pegawai" "persatuan peguam" "persatuan pekebun" "persatuan pekedai" "persatuan pekerja" "persatuan pekilang" "persatuan pelabur" "persatuan pemandu" "persatuan pembuat" "persatuan pemilik bengkel" "pemilik dan pemandu" "persatuan pemilik dan pengusaha" "persatuan pemilik lori" "persatuan pemilik teksi" "persatuan pembina " "persatuan pemborong" "persatuan penanam" "persatuan pendidik " "persatuan pengekspot" "persatuan pengetua" "persatuan pengilang" "persatuan pengimpot" "persatuan pengimport" "persatuan pengedar" "persatuan pengiklan" "persatuan peniaga" "persatuan peniaga dan penjaja" "persatuan penjaja" "persatuan pengadil" "persatuan pengamal" "persatuan pengurus industri kreatif" "persatuan pengusaha" "persatuan penjual" "persatuan penolong pegawai" "persatuan pensyarah" "persatuan penyelia asrama" "persatuan penternak" "persatuan penyelidik " "persatuan perdagang" "persatuan perindustrian" "persatuan perkhidmatan tadbir" "persatuan perniagaan" "persatuan perubatan" "persatuan peruncit" "persatuan perunding" "persatuan perusahaan" "persatuan petani" "persatuan rangkaian perniagaan" "persatuan restoran" "persatuan saudagar" "persatuan setiausaha" "persatuan syarikat" "persatuan tabib" "persatuan tadika" "persatuan teksi" "persatuan trak " "persatuan tunas usahawan" "persatuan tukang" "persatuan ulama" "persatuan undang undang" "persatuan usahawan" "persatuan veterinar" "persatuan wartawan" "persekutuan industri" "pertubuhan berhala" "pertubuhan doktor" "pertubuhan graduan" "pertubuhan industri" "pertubuhan juru" "pertubuhan kebajikan guru" "pertubuhan kebajikan kakitangan" "pertubuhan kebajikan pekerja" "pertubuhan kebajikan pemandu" "pertubuhan kebajikan peniaga" "pertubuhan kebajikan usahawan" "pertubuhan peguam" "pertubuhan perdagangan" "pertubuhan pekerja" "pertubuhan pemborong" "pertubuhan pengamal perubatan" "pertubuhan peniaga" "pertubuhan pengamal keselamatan" "pertubuhan pengusaha" "pertubuhan penternak" "pertubuhan perkilangan" "pertubuhan perniagaan" "pertubuhan pegawai" "pertubuhan usahawan" "perubatan homeop" "physicians and druggists association" "physicians association" "press club" "products association" "quarry owners association" "referees association" "rice importers association" "rubber dealers association" "shops association" "shopkeepers association" "tabung kebajikan pekerja" "taxi driver" "taxi owners association" "teachers association" "teachers union" "technologist" "trade association" "traders association" "workers association" "'






**17/10/2018 - keywods are selected based on activity of organisation. 
*1) 10100 activities that relates to religion. 
*2) 7400(ethnic) activities that serves a specific ethnic/religious (but non religious activties) group. 
* 3)'family/clan' association = 7400 because majority of family members tends to be in same ethnic group.

**recreation automatically assigned to 1300 because as name suggest activtiy is recreation

** many names are similar, with same meaning but in different order hence requiring more thant one keyword

** adding more keywords will increase dupcodes>1 and increase reassinging work, 

//------------------------------------------------------------------\\


  foreach ic of local icnpo {
	di as result "ICNPO `ic'"
	capture drop icnpo`ic'
	gen icnpo`ic' = 0
	local counter = 0
	foreach k of local keyword`ic' {
		di as input " `k'"
	replace icnpo`ic' = icnpo`ic' + (10^`counter') if regexm(lowname, "`k'") == 1
	local counter = `counter' + 1
	}
	local codelist = " `codelist' (icnpo`ic'>0) + "
}

* debug the code list
local codelist = " `codelist' 0 "
capture drop dupcodes
gen dupcodes = `codelist'
tab dupcodes

* results: 26/2/2019@18:09 (x-TU)
* dupcodes	Freq.	Percent			
* 	0		15,815	20.01	
*	1		61,573	77.92
*	2		1,598	2.02	
*	3		30		0.04		
*	Total	79,016	100.00

* results: 5/4/2019@18:53 (x-TU)
* dupcodes	Freq.	Percent			
* 	0		15,805	20.0	
*	1		61,557	77.92
*	2		1,624	2.02	
*	3		30		0.04		
*	Total	79,016	100.00

* results 17/4/2019@20:15 + TU
*  dupcodes |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          0 |     15,757       19.76       19.76
*          1 |     62,239       78.04       97.80
*          2 |      1,722        2.16       99.96
*          3 |         32        0.04      100.00
*------------+-----------------------------------
*      Total |     79,750      100.00


* results 30/5/2019@12:23 + TU
*  dupcodes |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          0 |     15,756       19.76       19.76
*          1 |     62,240       78.04       97.80
*          2 |      1,722        2.16       99.96
*          3 |         32        0.04      100.00
*------------+-----------------------------------
*      Total |     79,750      100.00


********************************

* create newvar - 'icnpo'
generate icnpo =.
label variable icnpo "International Classification of NonProfit Organisation codes"

label variable dupcodes "Duplicate ICNPO codes"


* dupcodes = 0 assigned to 12100
replace icnpo = 12100 if dupcodes==0

* dupcodes==1 assigned to respective ICNPO
replace icnpo = 1100 if dupcodes==1 & icnpo1100>=1
replace icnpo = 1200 if dupcodes==1 & icnpo1200>=1 
replace icnpo = 1300 if dupcodes==1 & icnpo1300>=1

replace icnpo = 2100 if dupcodes==1 & icnpo2100>=1
replace icnpo = 2200 if dupcodes==1 & icnpo2200>=1 
replace icnpo = 2300 if dupcodes==1 & icnpo2300>=1
replace icnpo = 2400 if dupcodes==1 & icnpo2400>=1
replace icnpo = 2500 if dupcodes==1 & icnpo2500>=1

replace icnpo = 3100 if dupcodes==1 & icnpo3100>=1
replace icnpo = 3200 if dupcodes==1 & icnpo3200>=1 
replace icnpo = 3300 if dupcodes==1 & icnpo3300>=1
replace icnpo = 3400 if dupcodes==1 & icnpo3400>=1

replace icnpo = 4100 if dupcodes==1 & icnpo4100>=1
replace icnpo = 4200 if dupcodes==1 & icnpo4200>=1 
replace icnpo = 4300 if dupcodes==1 & icnpo4300>=1 

replace icnpo = 5100 if dupcodes==1 & icnpo5100>=1
replace icnpo = 5200 if dupcodes==1 & icnpo5200>=1 

replace icnpo = 6100 if dupcodes==1 & icnpo6100>=1
replace icnpo = 6200 if dupcodes==1 & icnpo6200>=1 
replace icnpo = 6300 if dupcodes==1 & icnpo6300>=1

replace icnpo = 7100 if dupcodes==1 & icnpo7100>=1
replace icnpo = 7200 if dupcodes==1 & icnpo7200>=1 
replace icnpo = 7300 if dupcodes==1 & icnpo7300>=1
replace icnpo = 7400 if dupcodes==1 & icnpo7400>=1

replace icnpo = 8100 if dupcodes==1 & icnpo8100>=1

replace icnpo = 9100 if dupcodes==1 & icnpo9100>=1

replace icnpo = 10100 if dupcodes==1 & icnpo10100>=1
replace icnpo = 10200 if dupcodes==1 & icnpo10200>=1

replace icnpo = 11100 if dupcodes==1 & icnpo11100>=1

** above assignes all orgs in dupcodes==1 to respective ICNPO 


**************************************************************
* label ICNPO vars
label variable icnpo1100 "Culture and Arts"
label variable icnpo1200 "Sports"
label variable icnpo1300 "Other Recreation and Social Clubs"

label variable icnpo2100 "PreSchool, Primary and Secondary Education"
label variable icnpo2200 "Higher Education"
label variable icnpo2300 "Other Education"
label variable icnpo2400 "Research"
label variable icnpo2500 "Alumni and Student Services"

label variable icnpo3100 "Hospitals and Rehabilitation"
label variable icnpo3200 "Nursing Homes"
label variable icnpo3300 "Mental Health and Crisis Intervention"
label variable icnpo3400 "Other Health Services"

label variable icnpo4100 "Social Services"
label variable icnpo4200 "Emergency and Relief"
label variable icnpo4300 "Income Support and Maintenance"

label variable icnpo5100 "Environment"
label variable icnpo5200 "Animal Protection"

label variable icnpo6100 "Economic, Social and Community Development"
label variable icnpo6200 "Housing"                          
label variable icnpo6300 "Employment and Training"   
                       
label variable icnpo7100 "Civic and Advocacy Organisations"                     
label variable icnpo7200 "Law and Legal Services"                          
label variable icnpo7300 "Political Organisations" 
label variable icnpo7400 "Ethnic and Non-ritual Religious Organisations" 
                       
label variable icnpo8100 "Grantmaking Foundations & Volunteering Promotion"  
   
label variable icnpo9100 "International Activities" 
                        
label variable icnpo10100 "Religious Congregations"   
label variable icnpo10200 "Burial Associations"   
                      
label variable icnpo11100 "Business and Professional Associations"               
label variable icnpo12100 "Not Elsewhere Classified" 


*******************************************************************

* steps:
* 1) assign 'regulatory defined' categories to relevant ICNPO - ROY, SCO, politics [ROS], YM/WCA, rotary, lion [defined by ICNPO]

* 2) assign the 'obvious' to relevant ICNPO - eg. 'burial' & similar

* 3) assign dupcodes 3, 2 to relevant ICNPO

* 4) identify 'keywords', search for those not listed in correct cat, eg: 'kematian!=10200 or keturunan!=7100

* 5) run through 12100 for assign-able orgs.

** create table justifying why orgs/keyowrds/phrases assigned to a particualr cat.

********************************************************
**/ RULE to assign orgs to ICNPO \**

* all ROY = 7100 because youth orgs promote interest of one particular group ie youth. 2007 act states that youth orgs set up to promote youth development ['pembangunan belia di Malaysia dari aspek pendidikan, penyelidikan dan pembangunan sumber manusia']An Act to register youth societies, promote and facilitate the development of youth in Malaysia from the aspect of education, research and human resource, to establish a National Youth Consultative Council, to establish the Malaysian Institute For Research In Youth Development and to provide for related matters.
replace icnpo = 7100 if strpos(regulator, "ROY")!=0


* all SCO = 1200 because regulator/law says all sports org must register with SCO
replace icnpo = 1200 if strpos(regulator, "SCO")!=0

* all JHEKS = TU => 11100
replace icnpo = 11100 if strpos(regulator, "JHEKS")!=0

***************************************************************

* assign all in ROS category 'politics' to 7300 because regulator already classified them as political orgs
replace icnpo = 7300 if strpos(roscategory, "politics")!=0 
* includes all political party related orgs, deemed to be promoting political thought, elections etc
list lowname if strpos(lowname, " umno ")
replace icnpo = 7300 if strpos(lowname, " umno ")!=0 
list lowname icnpo if strpos(lowname, "penyokong barisan nasional") & icnpo!=7300
replace icnpo = 7300 if strpos(lowname, "penyokong barisan nasional") & icnpo!=7300

***********************************************************************

* assign aaccording to ICNPO specification
* ymca/ywca to 4100 as per ICNPO definition
replace icnpo = 4100 if strpos(lowname, "young mens christian association")!=0 
replace icnpo = 4100 if strpos(lowname, "young womens christian association")!=0

* rotary/rotaract & lions 1300 as per ICNPO def
list lowname if strpos(lowname, "rotary")
list lowname if strpos(lowname, "rotaract")
replace icnpo = 1300 if strpos(lowname, "rotar")!=0 

list lowname if strpos(lowname, "kelab lions")
replace icnpo = 1300 if strpos(lowname, "kelab lions")!=0 
list lowname if strpos(lowname, "lions club")
replace icnpo = 1300 if strpos(lowname, "lions club")!=0 

replace icnpo = 1300 if strpos(lowname, "kiwanis")!=0 


* assign all burial/funeral to 10200 because they are structured along religious lines
replace icnpo = 10200 if strpos(lowname, "khairat")!=0
replace icnpo = 10200 if strpos(lowname, "perkubur")!=0
replace icnpo = 10200 if strpos(lowname, "cemetery")!=0
replace icnpo = 10200 if strpos(lowname, "burial ground")!=0
replace icnpo = 10200 if strpos(lowname, "kematian")!=0
replace icnpo = 10200 if strpos(lowname, "kubor cina")!=0
replace icnpo = 10200 if strpos(lowname, "pengkebumian")!=0
replace icnpo = 10200 if strpos(lowname, "pengurusan kubur")!=0
replace icnpo = 10200 if strpos(lowname, "persemadian")!=0
replace icnpo = 10200 if strpos(lowname, "pekuburan")!=0
replace icnpo = 10200 if strpos(lowname, "pengurus kubur")!=0
replace icnpo = 10200 if strpos(lowname, "kuburan islam")!=0


* dewan perniagaan / chamber of commerce = 11100 based on activity regardless of beneficiary/ethnicity/relig
replace icnpo = 11100 if strpos(lowname, "dewan perniagaan")!=0 

tab icnpo
* pre 30/5: 14,950 in 12100
* 30/5: 14,903 in 12100

*********************************************************

** 7400 = protect the rights and promote the interest of and serving people from specific ethnic/religious groups

** if ethnic & religion present in org names:
* 1)social, recreational, sports = 1300/1200(sports) because object is sports & recreational & social activities. No elements of advocacy, promoting/protecting rights of any ethnic/religous groups. 

* 2) trade/professional = 11100 because its a trade org first and foremost 

* 3) culture = 1100 because object is promoting culture of a given group, not rights 

* 4) welfare = 4100, because object is welfare of given group (eg single mothers, orphans, elderly), only servicing the needs of that group & not protecting interest of any ethnic/religous group  

* 5) residents assoc = 6100 because object is RA (similar with trade)

* 6) orgs promoting welfare of religious groups but not promoting beliefs or rituals = 7400 e.g. 'badan kebajikan pekerja islam', despite word islam is not promoting religion but promoting interests of (muslim) employees

* 7) alumni = 2500 even if includes ethnic/religous term because object is alumni

* will create separate classifcation for ethnic based orgs regardless of object


***************************************************************

* look for unassigned orgs (cnpo==.) by keywords
* use dupcodes 3 as reference/suggestions

list lowname if dupcodes==3 & icnpo==.

* as a general rule, jasmani = 1200,includes pendidikan jasmani (but excldes assoc for pend jasmani teachers)
list lowname if strpos(lowname, "jasmani") & dupcodes>1 & icnpo==.
replace icnpo = 1200 if strpos(lowname, "jasmani")!=0 & dupcodes>1 & icnpo==.


* alumni/bekas murid/pelajar = 2500
list lowname if strpos(lowname, "bekas murid") & dupcodes>1 & icnpo==.
replace icnpo = 2500 if strpos(lowname, "bekas murid")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "persatuan alumni") & dupcodes>1 & icnpo==.
replace icnpo = 2500 if strpos(lowname, "persatuan alumni")!=0 & dupcodes>1 & icnpo==.
list lowname if strpos(lowname, "pertubuhan alumni") & dupcodes>1 & icnpo==.
replace icnpo = 2500 if strpos(lowname, "pertubuhan alumni")!=0 & dupcodes>1 & icnpo==.


* sukan & [rekreasi/sosial/ words desc recreational] = 1300 even if ethnity is present in name becos not promoting rights
list lowname if strpos(lowname, "rekreasi dan sukan") & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "rekreasi dan sukan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sukan dan rekreasi") & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sukan dan rekreasi")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sosial dan sukan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sosial dan sukan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sukan dan sosial ")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sukan dan sosial")!=0 & dupcodes>1 & icnpo==.

* kebudayaan & sukan = more sukan than kebudayaan, general cultural activities plus sports/rec, not specific enough to be on 1100
list lowname if strpos(lowname, "kebudayaan dan sukan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "kebudayaan dan sukan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sukan dan kebudayaan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sukan dan kebudayaan")!=0 & dupcodes>1 & icnpo==.

* similarly, kebajikan dan sosial/sukan - welfare in social/recreational sense = 1300
list lowname if strpos(lowname, "kebajikan dan sosial")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "kebajikan dan sosial")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sosial dan kebajikan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sosial dan kebajikan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kebajikan dan sukan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "kebajikan dan sukan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sukan dan kebajikan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sukan dan kebajikan")!=0 & dupcodes>1 & icnpo==.


* as with kebajikan dan sosial/sukan above, kebudayaan dan sosial, kebudayaan dan rekreasi = 1300
list lowname if strpos(lowname, "kebudayaan dan sosial")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "kebudayaan dan sosial")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "sosial dan kebudayaan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "sosial dan kebudayaan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kebudayaan dan rekreasi")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "kebudayaan dan rekreasi")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "persatuan rekreasi")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1300 if strpos(lowname, "persatuan rekreasi")!=0 & dupcodes>1 & icnpo==.


* sports name = 1200
list lowname if strpos(lowname, "kelab memanah")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1200 if strpos(lowname, "kelab memanah")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kelab ragbi")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1200 if strpos(lowname, "kelab ragbi")!=0 & dupcodes>1 & icnpo==.


*persatuan ibubapa dan guru, mahasiswa = 2500
list lowname if strpos(lowname, "persatuan ibubapa dan guru")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa dan guru")!=0 & dupcodes>1 & icnpo==.


*persatuan pencegahan penyakit = 3400
list lowname if strpos(lowname, "persatuan pencegahan penyakit")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 3400 if strpos(lowname, "persatuan pencegahan penyakit")!=0 & dupcodes>1 & icnpo==.


* 5100 - persatuan pencinta alam 
list lowname if strpos(lowname, "persatuan pencinta alam")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5100 if strpos(lowname, "persatuan pencinta alam")!=0 & dupcodes>1 & icnpo==.

* 5200 - "persatuan pencinta haiwan" "society for the prevention of cruelty to animals"
list lowname if strpos(lowname, "persatuan pencinta haiwan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan pencinta haiwan")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "society for the prevention of cruelty to animals")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "society for the prevention of cruelty to animals")!=0 & dupcodes>1 & icnpo==.

replace icnpo = 5200 if strpos(lowname, "pencegahan dan penganiyaan haiwan")!=0 & dupcodes>1 & icnpo==.

replace icnpo = 5200 if strpos(lowname, "persatuan pencinta kucing")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "pencinta burung")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan pencinta arnab")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan pencinta hak haiwan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan pencinta ikan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "yayasan pulau orang utan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan aktivis anjing dan kucing")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan pemandulan haiwan haiwan terbiar")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan pencinta unggas dan haiwan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "persatuan prihatin kebajikan haiwan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "pertubuhan tabung makanan haiwan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "yayasan kebajikan haiwan kebangsaan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "yayasan perlindungan hidupan liar")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "pemuliharaan hidupan penyu")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 5200 if strpos(lowname, "penyelamat haiwan")!=0 & dupcodes>1 & icnpo==.


* 4100 - persatuan warga emas, ibu tunggal, anak yatim
list lowname if strpos(lowname, "persatuan warga emas")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 4100 if strpos(lowname, "persatuan warga emas")!=0 & dupcodes>1 & icnpo==.
 
list lowname if strpos(lowname, "pertubuhan kebajikan warga emas")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 4100 if strpos(lowname, "pertubuhan kebajikan warga emas")!=0 & dupcodes>1 & icnpo==. 

list lowname if strpos(lowname, "ibu tunggal")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 4100 if strpos(lowname, "ibu tunggal")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "anak yatim")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 4100 if strpos(lowname, "anak yatim")!=0 & dupcodes>1 & icnpo==.

* yck = children welfare 4100
replace icnpo = 4100 if strpos(lowname, "yayasan chow kit")!=0 & dupcodes>1 & icnpo==.


* persatuan perubatan kecemasan= 4200
replace icnpo = 4200 if strpos(lowname, "persatuan perubatan kecemasan")!=0 & dupcodes>1 & icnpo==.



* orgs explicitly stating it serves a specific ethnic/relig group =7400 persatuan kebajikan dan pembangunan masyarakat india, persatuan kebajikan masyarakat india. Does not include words indicating recreation/sports/culture
list lowname if strpos(lowname, "pembangunan masyarakat india")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 7400 if strpos(lowname, "pembangunan masyarakat india")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kebajikan masyarakat india")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat india")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kebajikan kaum india")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 7400 if strpos(lowname, "kebajikan kaum india")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kebajikan masyarakat cina")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat cina")!=0 & dupcodes>1 & icnpo==.


* pendidikan akhlak & persatuan penganut  = 10100
list lowname if strpos(lowname, "pendidikan akhlak")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 10100 if strpos(lowname, "pendidikan akhlak")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "persatuan penganut")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 10100 if strpos(lowname, "persatuan penganut")!=0 & dupcodes>1 & icnpo==.


* keselamatan sukarela = 7200
replace icnpo = 7200 if strpos(lowname, "keselamatan sukarela")!=0 & dupcodes==2 & icnpo==.

* kepolisan komuniti = 7200
replace icnpo = 7200 if strpos(lowname, "kepolisan komuniti")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 7200 if strpos(lowname, "komuniti kepolisan")!=0 & dupcodes>1 & icnpo==.

* crime prevention 7200
replace icnpo = 7200 if strpos(lowname, "pencegahan jenayah")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 7200 if strpos(lowname, "anti jenayah")!=0 & dupcodes>1 & icnpo==.

* rehab 7200
replace icnpo = 7200 if strpos(lowname, "persatuan membantu orang orang dalam penyeliaan")!=0 & dupcodes>1 & icnpo==.

* consumer 7200
replace icnpo = 7200 if strpos(lowname, "pelindung kebajikan pengguna masyarakat")!=0 & dupcodes>1 & icnpo==.


* 11100 = kelab usahawan sahabat amanah ikhtiar 
list lowname if strpos(lowname, "persatuan guru") & dupcodes>1 & icnpo==. 
replace icnpo = 11100 if strpos(lowname, "persatuan guru")!=0 & dupcodes>1 & icnpo==.

list lowname if strpos(lowname, "kelab usahawan sahabat amanah ikhtiar") & dupcodes>1 & icnpo==. 
replace icnpo = 11100 if strpos(lowname, "kelab usahawan sahabat amanah ikhtiar")!=0 & dupcodes>1 & icnpo==.


* schools 2100
replace icnpo = 2100 if strpos(lowname, "pendidikan irsyad balok")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2100 if strpos(lowname, "al ehya asshariff")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2100 if strpos(lowname, "gemumi")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2100 if strpos(lowname, "yayasan sekolah menengah chong hwa kuantan")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2100 if strpos(lowname, "pengurusan sekolah menengah")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2100 if strpos(lowname, "pertubuhan pengurusan sekolah")!=0 & dupcodes>1 & icnpo==.

* tertiary/post sec 2200
replace icnpo = 2200 if strpos(lowname, "putra business school")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2200 if strpos(lowname, "dong jiao zong higher learning centre")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2200 if strpos(lowname, "hospital fatimah college of nursing")!=0 & dupcodes>1 & icnpo==.

* other school 2300
replace icnpo = 2300 if strpos(lowname, "outward bound trust")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2300 if strpos(lowname, "awlu malaysia foundation")!=0 & dupcodes>1 & icnpo==.

* research 2400
replace icnpo = 2400 if strpos(lowname, "persatuan penyelidik rimba")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2400 if strpos(lowname, "persatuan teknologi dan kejuruteraan kawasan utara")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 2400 if strpos(lowname, "persatuan teknologi farmaseutik malaysia")!=0 & dupcodes>1 & icnpo==.

* 2500
replace icnpo = 2500 if strpos(lowname, "badan kebajikan pelajar kumpulan pendidikan")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "bekas pelajar")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "persatuan mantan pelajar")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "persatuan siswazah")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "pertubuhan graduan")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa guru")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "pertubuhan pelajar")!=0 & dupcodes>1 & icnpo==. 

list lowname if strpos(lowname, "alumni association") & dupcodes>1 & icnpo==. 
replace icnpo = 2500 if strpos(lowname, "alumni association")!=0 & dupcodes>1 & icnpo==. 

replace icnpo = 2500 if strpos(lowname, "kelab alumni persatuan bahasa cina smk")!=0 & dupcodes>1 & icnpo==. 


* taijiquan & chin woo to 1200
replace icnpo = 1200 if strpos(lowname, "taijiquan")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 1200 if strpos(lowname, "qi gong")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 1200 if strpos(lowname, "qigong")!=0 & dupcodes>1 & icnpo==. 
replace icnpo = 1200 if strpos(lowname, "chin woo")!=0 & dupcodes>1 & icnpo==.
* senam to 1200
replace icnpo = 1200 if strpos(lowname, "senamrobik")!=0 & dupcodes>1 & icnpo==.
* dancesport to 1200
replace icnpo = 1200 if strpos(lowname, "dancesport")!=0 & dupcodes>1 & icnpo==.
* 1200 self defence
replace icnpo = 1200 if strpos(lowname, "seni mempertahankan diri")!=0 & dupcodes>1 & icnpo==.
replace icnpo = 1200 if strpos(lowname, "silat seni")!=0 & dupcodes>1 & icnpo==.


* international humanitarian 9100
replace icnpo = 9100 if strpos(lowname, "persatuan bantuan perubatan malaysia")!=0 & icnpo==.
replace icnpo = 9100 if strpos(lowname, "elephant foundation for starvation aid")!=0 & icnpo==.
replace icnpo = 9100 if strpos(lowname, "malaysian life line for syria")!=0 & icnpo==.


* susu ibu = advocacy =7100
replace icnpo = 7100 if strpos(lowname, "susu ibu")!=0 & icnpo==.

* bomba sukarela, kemanusiaan = emergency & relief 4200
replace icnpo = 4200 if strpos(lowname, "sukarela bomba")!=0 & dupcodes>1 & icnpo==.

replace icnpo = 4200 if strpos(lowname, "bantuan kemanusiaan")!=0 & dupcodes>1 & icnpo==.


* care homes, hospice 3200
replace icnpo = 3200 if strpos(lowname, "pertubuhan pengurusan pusat jagaan warga emas")!=0 & dupcodes>1 & icnpo==.

replace icnpo = 3200 if strpos(lowname, "hospis")!=0 & dupcodes>1 & icnpo==.

* mental health to 3300
replace icnpo = 3300 if strpos(lowname, "kesihatan minda")!=0 & icnpo==.
replace icnpo = 3300 if strpos(lowname, "psychiatric rehabilitation")!=0 & icnpo==.
replace icnpo = 3300 if strpos(lowname, " mental ")!=0 & icnpo==.

* health services = 3400
replace icnpo = 3400 if strpos(lowname, "society kidney foundation")!=0 & icnpo==.
replace icnpo = 3400 if strpos(lowname, "persatuan pendidik diabetes malaysia")!=0 & icnpo==.
replace icnpo = 3400 if strpos(lowname, "persatuan perubatan jantung")!=0 & icnpo==.
replace icnpo = 3400 if strpos(lowname, "pusat hemodialisis")!=0 & icnpo==.

* 5100 environment - pencinta alam to 5100
replace icnpo = 5100 if strpos(lowname, "pertubuhan warisan alam")!=0 & icnpo==. 
replace icnpo = 5100 if strpos(lowname, "persatuan pencinta flora dan fauna")!=0 & icnpo==.
replace icnpo = 5100 if strpos(lowname, "persatuan pencinta sungai dan saliran")!=0 & icnpo==.
replace icnpo = 5100 if strpos(lowname, "persatuan pengurusan sisa dan alam sekitar")!=0 & icnpo==.
replace icnpo = 5100 if strpos(lowname, "tropical rainforest conservation")!=0 & icnpo==.
replace icnpo = 5100 if strpos(lowname, "yayasan alam kekal dan regerasi")!=0 & icnpo==.

* residual perniagaan dupcode >1
replace icnpo = 11100 if strpos(lowname, "perniagaan")!=0 & icnpo==.


*7400 ethnic rights/welfare orgs - india

replace icnpo = 7400 if strpos(lowname, "kebajikan dan pembangunan sosial kaum india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "indian muslim association")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "pembangunan wanita komuniti india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat kaum india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan kebajikan komuniti india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "ekonomi dan usahawan masyarakat india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan dan pendidikan kaum india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan komuniti india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "pertubuhan komuniti india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "pembangunan ekonomi masyarakat india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "ekonomi dan sosial masyarakat india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "basmi kemiskinan masyarakat india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "prihatin kaum india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan komuniti kaum india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan kebajikan amal kaum india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "pembangunan ekonomi india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "pembangunan kemahiran insaniah kaum india")!=0 & icnpo==.


* 1300 - recreational clubs, even if includes ethnic/relig name - object deemed to be sports/rec and not civil rights
replace icnpo = 1300 if strpos(lowname, "dan rekreasi")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab rekreasi")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab sosial rekreasi")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "sukan rekreasi")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "rekreasi dan sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "pertubuhan rekreasi")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "rekreasi dan ekstrim")!=0 & icnpo==.


* 7400 ethnic orgs - cina
replace icnpo = 7400 if strpos(lowname, "kebajikan kaum cina")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "ikatan persatuan cina")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "pertubuhan kebajikan cina")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat kaum cina")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat kampung baru cina")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "gabungan persatuan cina")!=0 & icnpo==.


* keyword 'golf' - various icnpo cat
* 1300 indicating golf & rec club
replace icnpo = 1300 if strpos(lowname, "golf and country club")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "golf country club")!=0 & icnpo==.


* 1200 golf club for alumni, object is golf-sport
replace icnpo = 1200 if strpos(lowname, "kelab golf alumni smsah")!=0 & icnpo==.


* 6100 = RA if open to all, not ethnic specific
replace icnpo = 6100 if strpos(lowname, "persatuan penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "persatuan keselamatan dan sosial penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "persatuan kebajikan masyarakat penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "kelab sosial penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "persatuan kebajikan keluarga dan penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "badan kebajikan penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "pertubuhan penduduk")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "pertubuhan komuniti taman")!=0 & icnpo==.


* persatuan pengusaha /usahawan - trade/commerce = 11100
replace icnpo = 11100 if strpos(lowname, "persatuan pengusaha")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "kelab pengusaha")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan usahawan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "kelab usahawan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "pertubuhan komuniti usahawan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "yayasan keusahawanan")!=0 & icnpo==.


* 'rights' of wakil rakyat & the families = 7100
replace icnpo = 7100 if strpos(lowname, "wakil rakyat")!=0 & icnpo==.

* 2500 - yayasan alumni
replace icnpo = 2500 if strpos(lowname, "yayasan alumni")!=0 & icnpo==.


* keyword 'buddha' - various icnpo, 10100 religious rituals, 7100 welfare fo followers
replace icnpo = 10100 if strpos(lowname, "persatuan pendidikan buddha")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "persatuan pendidikan agama buddha")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "kebajikan agama buddha")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "penyelidikan agama buddha")!=0 & icnpo==.

* penganut + religion name = association for welfare of adherents, not entirely ritual =>7400
replace icnpo = 7400 if strpos(lowname, "penganut buddha")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "penganut agama buddha")!=0 & icnpo==.


* persatuan peniaga w/o ethnic/relig
replace icnpo = 11100 if strpos(lowname, "persatuan peniaga")!=0 & icnpo==.


* warga tua berida / senior citizens = 4100 except rumah kebajikan (3200)
replace icnpo = 4100 if strpos(lowname, "persatuan wargatua")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "kelab wargatua")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "persatuan kebajikan warga emas")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "pertubuhan warga istimewa")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "yayasan kebajikan warga emas")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "persatuan warga berida")!=0 & icnpo==.

replace icnpo = 3200 if strpos(lowname, "rumah kebajikan warga emas")!=0 & icnpo==.


* most keywords used from this point on are residuals, if used earlier may cause orgs to be mixed, some assigned to wrong icnpo

* diabled = 4100
replace icnpo = 4100 if strpos(lowname, "orang kurang upaya")!=0 & icnpo==.


* 1100 culture
replace icnpo = 1100 if strpos(lowname, "persatuan kebudayaan dan kesenian")!=0 & icnpo==.

* taoism - 10100 ajaran, 7100 penganut
replace icnpo = 10100 if strpos(lowname, "persatuan ajaran taoism")!=0 & icnpo==.

* penganut = 7400
replace icnpo = 7400 if strpos(lowname, "kebajikan penganut penganut taoisma")!=0 & icnpo==.


* sokongan - support group 4100
replace icnpo = 4100 if strpos(lowname, "sokongan kanser")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "perihatin kanak kanak kanser")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "persatuan sokongan penyakit alzheimer")!=0 & icnpo==.


* foundation/yayasan - some 8100, others various
replace icnpo = 8100 if strpos(lowname, "korean education foundation")!=0 & icnpo==.

* edu research for tamils
replace icnpo = 7400 if strpos(lowname, "tamil educational research and development foundation")!=0 & icnpo==.

replace icnpo = 4300 if strpos(lowname, "swastika")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "iium alumni")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, " kaying ")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "warisan tamil")!=0 & icnpo==.


replace icnpo = 10100 if strpos(lowname, "sai baba")!=0 & icnpo==.

replace icnpo = 2100 if strpos(lowname, "chinese school foundation")!=0 & icnpo==. 

replace icnpo = 1200 if strpos(lowname, "martial arts")!=0 & icnpo==.

replace icnpo = 4200 if strpos(lowname, "disaster rescue")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "community support")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "sevai ashram")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "cancerlink foundation")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "cancer foundation")!=0 

replace icnpo = 4100 if strpos(lowname, "charis foundation")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "childrens home foundation")!=0 & icnpo==.

replace icnpo = 4300 if strpos(lowname, "food aid foundation")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan tahfiz")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "recreation club")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "anak seni")!=0 & icnpo==.

replace icnpo = 4200 if strpos(lowname, "bomba sukarela")!=0 & icnpo==.


* kebajikan masyarakat - 7100 if ethnic/relig, 6100 if penduduk, 4100 if general
replace icnpo = 4300 if strpos(lowname, "kebajikan masyarakat kampung")!=0 & icnpo==.



replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat islam")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat tiong hwa")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "bajau")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat bongawan")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat tamilar")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat dayak")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan masyarakat bidayuh")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "masyarakat melayu")!=0 & icnpo==.


replace icnpo = 1300 if strpos(lowname, "pertubuhan kebajikan masyarakat dan sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan kebudayaan dan kebajikan masyarakat")!=0 & icnpo==.





* kebajikan komuniti + eth/relig = 7400, 4100 otherwise
replace icnpo = 7400 if strpos(lowname, "kebajikan komuniti islam")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan komuniti sikh")!=0 & icnpo==.


replace icnpo = 6100 if strpos(lowname, "kebajikan komuniti taman")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "kebajikan komuniti kampung")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kebajikan komuniti dan sosial")!=0 & icnpo==.


* keluarga/clan = 7400 on the basis that families tend to be form same ethnic background
replace icnpo = 7400 if strpos(lowname, "persatuan ahli keluarga")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan warisan keluarga haji")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan warisan keluarga pangiran")!=0 & icnpo==.

* political party linked 7300
replace icnpo = 7300 if strpos(lowname, "barisan nasional")!=0 & icnpo==.

replace icnpo = 7300 if strpos(lowname, "kelab penyokong parti rakyat")!=0 & icnpo==.


* kelab - most likely 1300
replace icnpo = 1300 if strpos(lowname, "kelab sokanjaya")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab sukan sikh")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kawalan jauh")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab permotoran")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab motor lasak")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab riadah")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab berbasikal")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab peminat")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab bermotor")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab penyokong tottenham")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab sukan permotoran bmw")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab basikal")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab kompang dan sukan")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kelab pemilik dan pemandu lori")!=0 & icnpo==.

* kebajikan kakiktangan deemed to promote welfare (incl rights) of employees therefore 11100
replace icnpo = 11100 if strpos(lowname, "kelab kakitangan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "kelab kebajikan kakitangan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "kelab kebajikan staf")!=0 & icnpo==.

* sukarelawan = 8100
replace icnpo = 8100 if strpos(lowname, "kelab sukarelawan")!=0 & icnpo==.

* promoting seni budaya but not promoing rights of eyhinc grp
replace icnpo = 1100 if strpos(lowname, "seni budaya")!=0 & icnpo==.

* women rights = 7100
replace icnpo = 7100 if strpos(lowname, "kelab kebajikan wanita")!=0 & icnpo==.

* alumni but of different forms, not students are still 2500
replace icnpo = 2500 if strpos(lowname, "alumni kelab bell")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "kelab alumni batch akaun kolej")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "alumni pergerakan pemuda")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "persatuan kebajikan alumni timur tengah yayasan pengajian tinggi")!=0 & icnpo==.


* yayasan but not all are 8100, depends on specific object
replace icnpo = 10100 if strpos(lowname, "yayasan wat boonyaram")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan dakwah")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan sekolah al quran")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan percetakan al quran")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan pendidikan al quran")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan pendidikan maahad tahfiz")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan pema norbu vihara")!=0 & icnpo==.

replace icnpo = 7100 if strpos(lowname, "persatuan wanita")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan pekerja")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "yayasan karate")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "gabungan pelajar melayu")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "yayasan institut al quran")!=0 & icnpo==.

replace icnpo = 4300 if strpos(lowname, "miskin")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "pendidikan dan pembangunan autisma")!=0 & icnpo==.

* remaining yayasan at this point all 8100
replace icnpo = 8100 if strpos(lowname, "yayasan")!=0 & icnpo==.

* similarly, all remaining sukarelawan = 8100
replace icnpo = 8100 if strpos(lowname, "sukarelawan")!=0 & icnpo==.


replace icnpo = 7400 if strpos(lowname, "persatuan keturunan")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "hakka")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "komuniti islam")!=0 & icnpo==.


replace icnpo = 10100 if strpos(lowname, "badan kebajikan islam")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "persatuan catur")!=0 & icnpo==.


replace icnpo = 1100 if strpos(lowname, "muzik gereja")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan pegawai")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "persatuan pengamal ajaran hindu")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "malaysian society of")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan syarikat")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan undang undang")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "khoo kongsi")!=0 & icnpo==.

replace icnpo = 4300 if strpos(lowname, "badan amal")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "thendayuthapani temple")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "alumni majlis belia")!=0 & icnpo==.

replace icnpo = 8100 if strpos(lowname, "scholarship fund")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "chinese benevolent society")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "sports club")!=0 & icnpo==.

replace icnpo = 4200 if strpos(lowname, "institusi sarjana pengurusan bencana")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "rumah kanak kanak")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "malaysian zoological society")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "persatuan graduan")!=0 & icnpo==.


replace icnpo = 8100 if strpos(lowname, "education trust fund")!=0 & icnpo==.

replace icnpo = 2100 if strpos(lowname, "lembaga pengurus sekolah")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan tarian")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan sosial")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "persatuan renang")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan sejarah")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan kebudayaan dan kebajikan")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan kebudayaan arulmiguntha")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan kebudayaan kesenian")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan peminat")!=0 & icnpo==.


replace icnpo = 7400 if strpos(lowname, "persatuan komuniti kristian")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan komuniti muslim")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "persatuan kristian")!=0 & icnpo==.

replace icnpo = 4300 if strpos(lowname, "persatuan amal")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan artis")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "silambam")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan pencinta kesenian")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan pencinta warisan")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "aktivis seni warisan")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "kebudayaan dan warisan")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "kebudayaan kaum india")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan anggota jurulatih")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan kakitangan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "dealers association")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan doktor")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan perdagangan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "kebajikan guru")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "faedah bersama soon heng")!=0 & icnpo==.

replace icnpo = 7100 if strpos(lowname, "persatuan belia")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan huang")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kebudayaan dan intergrasi masyarakat india")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan kwang")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kebajikan am dan sukan")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "amal dan sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kebudayaan belia dan sukan")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kebudayaan dan riadah")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan seni")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kesukanan dan sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kebudayaan pembangunan dan sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "pendidikan dan sukan")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan keluarga kementerian")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "kesenian dan sosial")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "muzik dan sukan")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "persatuan sukan kebajikan")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "pembangunan sosio budaya dan sukan")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "warisan budaya kesenian")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan penulis kreatif")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "pertubuhan ghazal")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan dramatik")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan kebudayaan seni")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan kebudayaan tarian")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "penyelidikan seni lukis dan kaligrafi")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persahabatan penggiat seni")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "komuniti filharmonik")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "budi suci sejati")!=0 & icnpo==.

replace icnpo = 1200 if strpos(lowname, "persatuan senaman")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "muzikal dan kesenian")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "pertubuhan peminat kompang")!=0 & icnpo==.

replace icnpo = 1300 if strpos(lowname, "peminat bintang filem")!=0 & icnpo==.


replace icnpo = 11100 if strpos(lowname, "persatuan penerbit")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "kebajikan warga pendidikan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan persahabatan saudagar")!=0 & icnpo==.


replace icnpo = 8100 if strpos(lowname, "persatuan sukarela")!=0 & icnpo==.

replace icnpo = 7100 if strpos(lowname, "persatuan pesara")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "persatuan warisan keluarga")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "pertubuhan komuniti kejiranan")!=0 & icnpo==.

replace icnpo = 4300 if strpos(lowname, "pertubuhan kebajikan kemasyarakatan")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "persatuan pendidikan falsafah kung")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "christian fellowship")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "gospel fellowship")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "christian faith fellowship")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "dakwah islamiah")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "amal pengajian al quran")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "pertubuhan rumah anak")!=0 & icnpo==.

replace icnpo = 4100 if strpos(lowname, "kanak istimewa")!=0 & icnpo==.

replace icnpo = 3400 if strpos(lowname, "pertubuhan amal pesakit")!=0 & icnpo==.

replace icnpo = 4200 if strpos(lowname, "bantuan bencana")!=0 & icnpo==.

replace icnpo = 3400 if strpos(lowname, "penyakit tidak berjangkit")!=0 & icnpo==.

replace icnpo = 3400 if strpos(lowname, "pencegahan tuberkulosis")!=0 & icnpo==.

replace icnpo = 7100 if strpos(lowname, "pembangunan sokongan pendidikan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan kejuruteraan")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan kebajikan pekerja")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "pemandu teksi")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan pemandu")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan kebajikan peniaga")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan pekebun")!=0 & icnpo==.

replace icnpo = 11100 if strpos(lowname, "persatuan penjaja")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "persatuan penghuni")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "persatuan kebajikan penduduk")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "kebajikan sosial masyarakat india")!=0 & icnpo==.

replace icnpo = 1100 if strpos(lowname, "persatuan kebudayaan")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa pelajar")!=0 & icnpo==.

replace icnpo = 6300 if strpos(lowname, "persatuan pembangunan usahawan")!=0 & icnpo==.

replace icnpo = 2500 if strpos(lowname, "siswa")!=0 & icnpo==.

replace icnpo = 6100 if strpos(lowname, "persatuan perhubungan penduduk")!=0 & icnpo==.


replace icnpo = 4300 if strpos(lowname, "persatuan kebajikan")!=0 & icnpo==.
replace icnpo = 4300 if strpos(lowname, "pertubuhan kebajikan")!=0 & icnpo==.


replace icnpo = 11100 if strpos(lowname, "business networking")!=0 & icnpo==.

replace icnpo = 10100 if strpos(lowname, "pertubuhan agama")!=0 & icnpo==.
replace icnpo = 10100 if strpos(lowname, "pertubuhan penganut")!=0 & icnpo==.

replace icnpo = 7100 if strpos(lowname, "persatuan kaum wanita")!=0 & icnpo==.
replace icnpo = 7100 if strpos(lowname, "persatuan kaum ibu")!=0 & icnpo==.

replace icnpo = 7400 if strpos(lowname, "masyarakat india")!=0 & icnpo==.
replace icnpo = 7400 if strpos(lowname, "kaum india")!=0 & icnpo==.
replace icnpo = 7400 if strpos(lowname, "kaum cina")!=0 & icnpo==.

replace icnpo = 3400 if strpos(lowname, "persatuan yoga")!=0 & icnpo==.
replace icnpo = 8100 if strpos(lowname, "foundation of malaysian institute")!=0 & icnpo==.
replace icnpo = 10100 if strpos(lowname, "science of spirituality")!=0 & icnpo==.


tab icnpo

list lowname if icnpo==.

* all asigned but there is still many in 12100 to be assigned
* 30/5/2019@13:01
save "\\dochart\users\nbp1\Desktop\AllOrgs+TU_ICNPOsorted_20190530.dta", replace

*****************************************************************************

* from 12100 - the following keywords only possible after all have been assigned, and to extract orgs from 12100. Cannot be used during earleir stages as it will misallocate some orgs with same keywords but different object

* check for religous orgs in 12100 ie dupcodes=0
list lowname if strpos(lowname, "buddha") & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "buddha")!=0 & icnpo==12100

list lowname if strpos(lowname, "kristian") & icnpo==12100
replace icnpo = 2100 if strpos(lowname, "majlis sekolah sekolah kristian")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "kristian")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "kristen")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, " tao ")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "dharma")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "krishna")!=0 & icnpo==12100


replace icnpo = 4100 if strpos(lowname, "cacat penglihatan")!=0 & icnpo==7100

replace icnpo = 2500 if strpos(lowname, "persatuan bekas johannians")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "anak melayu")!=0 & icnpo==12100

replace icnpo = 2200 if strpos(lowname, "malaysian institute of art")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "malaysian institute of")!=0 & icnpo==12100

* advocacy/civil rights
replace icnpo = 7100 if strpos(lowname, "business ethics institute")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "womens institute of management")!=0 & icnpo==12100

* academic/policy research
replace icnpo = 2400 if strpos(lowname, "institute of strategic")!=0 & icnpo==12100
replace icnpo = 2400 if strpos(lowname, "international institute of advanced islamic studies")!=0 & icnpo==12100
replace icnpo = 2400 if strpos(lowname, "progressive institute of public policy analysis")!=0 & icnpo==12100

* HE educ inst
replace icnpo = 2200 if strpos(lowname, "maju institute of educational development")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, "kelab massachussetts institute of technology")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "shudokan institute of aikido")!=0 & icnpo==12100


* not all 'institute of' are 11100, the foll are remainder after aother assigned
replace icnpo = 11100 if strpos(lowname, "institute of")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "persatuan saintis")!=0 & icnpo==12100


* remainder 'sukan dan ...' assigned to 1300 
replace icnpo = 1300 if strpos(lowname, "kelab sukan dan")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "kelab sukan kesenian dan kebajikan")!=0 & icnpo==12100

* the following remainder "kelab sukan " in 12100 do not have any word after 'sukan' indicating recreation or social, i.e. purely 'sukan' therefore 1200
* kelab sukan w/o any other keyword (such as rekresasi sosial etc) are deemed sports club even if its belongs to corp or govt because 'provides sport activities' as per icnpo
replace icnpo = 1200 if strpos(lowname, "kelab sukan ")!=0 & icnpo==12100

* the foll 'kebajikan india' are 7100 purely rights
replace icnpo = 7400 if strpos(lowname, "kebajikan india")!=0 & icnpo==12100

* similarly, majlis sukan with corp/agency name but no other keywords == 1200
replace icnpo = 1200 if strpos(lowname, "majlis sukan jabatan")!=0
 
replace icnpo = 1300 if strpos(lowname, "majlis sukan dan")!=0 & icnpo==12100

* remainder majlis sukan
replace icnpo = 1200 if strpos(lowname, "majlis sukan ")!=0 & icnpo==12100

*kusta to 3400
replace icnpo = 3400 if strpos(lowname, "persatuan pemulihan kusta")!=0 & icnpo==12100

* welfare to 4100
replace icnpo = 4100 if strpos(lowname, "kebajikan bekas pesakit kusta")!=0 & icnpo==12100

* look for bikers 
list lowname icnpo if strpos(lowname, "biker") & icnpo==12100
replace icnpo = 1300 if strpos(lowname, "biker")!=0 & icnpo==12100


replace icnpo = 4100 if strpos(lowname, "persatuan kebajikan anak anak keluarga ibu dan bapa tunggal")!=0 & icnpo==12100

replace icnpo = 4300 if strpos(lowname, "relief society")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, "warga emas")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "warga tua")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, "persatuan kebajikan anak kepada pesakit")!=0 & icnpo==12100

* minang (kabau), bawean etc = 7400
replace icnpo = 7100 if strpos(lowname, "minang")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bawean")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "mandailing")!=0 & icnpo==12100

*kebajikan anak anak+ = 7100, not certain if represents whole ethnic group, could be misture esp if foll by name of place/state
* execute once others assigned
replace icnpo = 7100 if strpos(lowname, "kebajikan anak")!=0 & icnpo==12100


* religious
replace icnpo = 10100 if strpos(lowname, "pusat buddhisma")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "pertubuhan perundingan buddhis")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "confuc")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "pengajaran taoist")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "meditasi shridi sai")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "persatuan keagamaan siddhaas")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "keagamaan saraswathy")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "pengikut agama kai")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "kebajikan agama yong")!=0 & icnpo==12100



* non reli oriented orgs with relig names = 1300/1100/7100 if followers
replace icnpo = 1300 if strpos(lowname, "pertubuhan kebajikan dan kebudayaan hindu")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "kebudayaan hindu")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "permuafakatan kaum hindu")!=0 & icnpo==12100

* residual, after other assigned remainder hindu in 12100 => 10100
replace icnpo = 10100 if strpos(lowname, "hindu")!=0 & icnpo==12100


* islam in 12100
*'saudara' indicate welfare/rights of followers & not rituals per se (although does incl rituals & relig edu but primarily welfare = 7100
replace icnpo = 7400 if strpos(lowname, "saudara islam")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "saudara muslim")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "saudara baru")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "masyarakat islam")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "warga islam")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "umat islam")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "orang asli islam")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "wanita islam")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "orang islam")!=0 & icnpo==12100

replace icnpo = 6100 if strpos(lowname, "penduduk islam")!=0 & icnpo==12100

replace icnpo = 2400 if strpos(lowname, "institut kerjasama islam antarabangsa malaysia")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "dawoodi")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "india muslim")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "tamil muslim")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "malabar")!=0 & icnpo==12100


replace icnpo = 10100 if strpos(lowname, "persatuan islam")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "pembangunan pendidikan islam")!=0 & icnpo==12100


replace icnpo = 8100 if strpos(lowname, "islamic outreach")!=0 & icnpo==12100

replace icnpo = 2400 if strpos(lowname, "institut kefahaman islam malaysia")!=0 & icnpo==12100


* kebajikan anggota = kebajikan kakitangan/staf = 11100
replace icnpo = 11100 if strpos(lowname, "kebajikan anggota")!=0 & icnpo==12100


replace icnpo = 7100 if strpos(lowname, "persatuan bekas penduduk")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "persatuan pembangunan penduduk india")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "persatuan muhibbah")!=0 & icnpo==12100
replace icnpo = 1300 if strpos(lowname, "persatuan muhibah")!=0 & icnpo==12100


* many types of orgs with 'kimlan', residuals in 12100 = 1300
replace icnpo = 1300 if strpos(lowname, "kimlan")!=0 & icnpo==12100

* korea - deemed to be promoting rights of koreans
replace icnpo = 7400 if strpos(lowname, "korea")!=0 & icnpo==12100

replace icnpo = 3200 if strpos(lowname, "eldercare")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "the potters")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "seminar")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "vipassana")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "shekina")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "trinity")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "tabernacle")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "calvary")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "charis ")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "akhlak")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "persatuan sembahyang")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "subramaniar")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "aalayam")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "pengurusan surau")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "alayam")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "sri maha")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "gurukul")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, " dewa ")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "penganut")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "bodhi")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "gurudwara")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "kuan yen")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "breastfeeding")!=0 & icnpo==12100


replace icnpo = 1200 if strpos(lowname, "rugby union")!=0 & icnpo==12100


replace icnpo = 8100 if strpos(lowname, "salvation army")!=0 & icnpo==12100
replace icnpo = 8100 if strpos(lowname, "mercy mission malaysia")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "malaysian technical standards")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "malaysian timber")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "malaysian music publishers")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "pharmaceutical")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "palm oil")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "petroleum")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "pertubuhan pemandu")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "persatuan tuan punya")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "kereta sewa")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "pemandu teksi")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "persatuan perniaga")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pertubuhan petani")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pekebun")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "peladang")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pengusaha")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "restoran")!=0 & icnpo==12100


* ' staf ' malay-nised word for staff org promoting welfare of workers
replace icnpo = 11100 if strpos(lowname, " staf ")!=0 & icnpo==12100


replace icnpo = 2400 if strpos(lowname, "penang institute")!=0 & icnpo==12100

                                                                                
replace icnpo = 1300 if strpos(lowname, "silatur")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "rekreasi")!=0 & icnpo==12100


replace icnpo = 7100 if strpos(lowname, "persatuan bekas pesilat")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "jetty kongsi")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "silat")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "tai chi")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "jasmani")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "kelab penyair")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "seni mu")!=0 & icnpo==12100


replace icnpo = 7400 if strpos(lowname, "tamilar")!=0 & icnpo==12100


replace icnpo = 4200 if strpos(lowname, "persatuan kecemasan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "pasukan penyelamat kecemasan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "kerjasama kecemasan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "tindakan kecemasan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "pasukan elite kecemasan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "perawatan kecemasan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "latihan kecemasan")!=0 & icnpo==12100


replace icnpo = 2500 if strpos(lowname, "penuntut")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa bagi pelajar")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa sekolah")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa murid")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "gagasan pelajar")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "hal ehwal pelajar")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa mahasiswa")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "persatuan ibubapa & pendidik")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "mahasiswa")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, "persatuan murid")!=0 & icnpo==12100


replace icnpo = 7100 if strpos(lowname, "persatuan ibubapa untuk pendidikan malaysia")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, "pekak")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kelainan upaya")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kurang upaya")!=0 & icnpo==12100

replace icnpo = 2100 if strpos(lowname, "al mashoor islamic school")!=0 & icnpo==12100

* the following keywords can only be used to identify/assign residuals, not to be used earleir as it will include those not relevant to cat.
replace icnpo = 11100 if strpos(lowname, "kerja islam")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "ikatan usahawan")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "majlis usahawan")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "usahawan wanita")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "rangkaian usahawan")!=0 & icnpo==12100

*  read as 'welfare of islam' 
replace icnpo = 10100 if strpos(lowname, "kebajikan islam")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "pertubuhan tarbiah islam subang")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "pusat islam hamidiah")!=0 & icnpo==12100
                                                                                
replace icnpo = 11100 if strpos(lowname, "kebajikan wanita")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "kebajikan perempuan")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "peniaga kecil melayu")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "peniaga melayu")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "food truck")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, "ikatan graduan")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "persatuan kebangsaan melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "dewan perhimpunan melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "gabungan ngo islam dan melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kongres melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persatuan rumpun melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "jemaah melayu ")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "penyatuan pembelaan melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "perpaduan melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kebajikan orang melayu")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "melayu islam")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kebajikan melayu")!=0 & icnpo==12100


replace icnpo = 11100 if strpos(lowname, "agency")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "persuratan melayu")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "pementasan seni kebudayaan")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "adat budaya melayu")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "keris warisan melayu")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "warisan seni melayu")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "pertubuhan pemidato")!=0 & icnpo==12100


replace icnpo = 7400 if strpos(lowname, "pertubuhan klan cina")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "penyokong pendidikan cina")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "penyokong pendidikan bahasa cina")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "kelab kebudayaan cina")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "pertubuhan gendang tradisional")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "permainan tradisi")!=0 & icnpo==12100
 
 
replace icnpo = 7100 if strpos(lowname, "pesara ")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas anggota")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "pertubuhan guru ")!=0 & icnpo==12100


replace icnpo = 4100 if strpos(lowname, "rumah kebajikan kanak")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "perlindungan kanak")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kanak kerencatan akal")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "pemeliharaan dan penyaraan kanak")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "pelindung dan penyelamat kanak")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kanak khas")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "rumah perlindungan wanita")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kanak berkeperluan khas")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kanak insan istimewa")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "kesedaran hak kanak kanak")!=0 & icnpo==12100

replace icnpo = 3300 if strpos(lowname, "persatuan psikiatri kanak")!=0 & icnpo==12100
replace icnpo = 3300 if strpos(lowname, "kesihatan mental")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "persatuan pengasuh")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, "pertubuhan pendidikan perubatan lepas")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "kelab keluarga dayabudi")!=0 & icnpo==12100


replace icnpo = 4100 if strpos(lowname, " buta ")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "wargaemas")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kanser ")!=0 & icnpo==12100

* to assign jab org asli rec club to 1300 first before assigning remaining 'orang asli' in 12100 to 7100
replace icnpo = 1300 if strpos(lowname, "badan keluarga jabatan")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "orang asli")!=0 & icnpo==12100
*****

replace icnpo = 7100 if strpos(lowname, "veteran")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "bugis")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, " om sri ")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "kontraktor")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pemborong")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "penjual")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pedagang")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "peruncit")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "francais")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, " trade")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pembatek")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pengail")!=0 & icnpo==12100

replace icnpo = 6100 if strpos(lowname, "pangsa")!=0 & icnpo==12100

replace icnpo = 7200 if strpos(lowname, "consumer")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "peniaga")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "penjaja")!=0 & icnpo==12100

* the following 'penjara' refers to assocctioans for prison officers or similar
replace icnpo = 1300 if strpos(lowname, "penjara")!=0 & icnpo==12100

* 'wanita' can only be used once all other assigned [a few non-wanita might be included]
replace icnpo = 7100 if strpos(lowname, "wanita")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "kelab shah alam selangor")!=0 & icnpo==12100
replace icnpo = 1300 if strpos(lowname, "kelab pejabat residen")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, "persatuan bekas penghuni kolej")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "persatuan bekas penghuni pulau")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "young president")!=0 & icnpo==12100

replace icnpo = 6100 if strpos(lowname, "residen")!=0 & icnpo==12100

* pertubuhan artis = association for those on the profession and not the arts
replace icnpo = 11100 if strpos(lowname, "pertubuhan artis")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pertubuhan kebajikan artis")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "kelab artis")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "kesenian dan warisan")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "bajau")!=0 & icnpo==12100

* ketua kaum/masyarakat = ketua kampung
replace icnpo = 11100 if strpos(lowname, "ketua kaum")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "persatuan ketua masyarakat")!=0 & icnpo==12100


replace icnpo = 7400 if strpos(lowname, "pertubuhan po toh")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "pertubuhan eng chuan")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "berkaum leong")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persatuan sahabat kaum semai")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kebajikan suku kaum timor")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kaum tami")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "pertubuhan kaum keluarga tan")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persaudaraan kaum keluarga song")!=0 & icnpo==12100



replace icnpo = 11100 if strpos(lowname, "money")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "persatuan punjabi")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "pertubuhan budaya")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, " sejarah ")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "tenaga pengajar")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "persatuan pengajar ")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "perusahaan kecil")!=0 & icnpo==12100


replace icnpo = 8100 if strpos(lowname, "wang biasiswa")!=0 & icnpo==12100
replace icnpo = 8100 if strpos(lowname, "tabong biasiswa")!=0 & icnpo==12100
replace icnpo = 8100 if strpos(lowname, "tabung biasiswa")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "dakwah")!=0 & icnpo==12100

replace icnpo = 2400 if strpos(lowname, "persatuan tindakan dan penyelidikan aids")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, " aids ")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "persatuan rakan niaga")!=0 & icnpo==12100

replace icnpo = 2400 if strpos(lowname, "malaysian association for the study")!=0 & icnpo==12100


replace icnpo = 2400 if strpos(lowname, "malaysian association of japanese studies")!=0 & icnpo==12100
replace icnpo = 2400 if strpos(lowname, "malaysian association of applied linguistics")!=0 & icnpo==12100
replace icnpo = 7200 if strpos(lowname, "malaysian association for doping control")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "persatuan kesihatan ibu dan bayi")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "pertubuhan perpaduan dan kemanusiaan malaysia")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "persatuan hubungan antara tamadun dan budaya")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, " pemilik ladang")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, "old grad association")!=0 & icnpo==12100

* the foll are residuals, only to be applied once all are assigned
replace icnpo = 11100 if strpos(lowname, "malaysian association")!=0 & icnpo==12100
 
replace icnpo = 7200 if strpos(lowname, "fujian")!=0 & icnpo==12100  

replace icnpo = 11100 if strpos(lowname, "malim gunung")!=0 & icnpo==12100  

replace icnpo = 1200 if strpos(lowname, "ki gunung")!=0 & icnpo==12100  

replace icnpo = 4200 if strpos(lowname, "mencari dan menyelamat")!=0 & icnpo==12100  


replace icnpo = 5100 if strpos(lowname, "gunung dan hutan")!=0 & icnpo==12100  

replace icnpo = 6100 if strpos(lowname, "persatuan flat")!=0 & icnpo==12100


replace icnpo = 7400 if strpos(lowname, "pembangunan kominiti india")!=0 & icnpo==12100


replace icnpo = 1100 if strpos(lowname, "kutub khanah awam")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "kelab seni ")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "kelab seniman jalan")!=0 & icnpo==12100
replace icnpo = 1100 if strpos(lowname, "kelab senikraf ")!=0 & icnpo==12100


replace icnpo = 1300 if strpos(lowname, "kelab kwsp")!=0 & icnpo==12100
replace icnpo = 1300 if strpos(lowname, "kelab ibu pejabat")!=0 & icnpo==12100
replace icnpo = 1300 if strpos(lowname, "kelab malaysia airports")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "persatuan guanxi")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "persatuan pemaju")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "persatuan perkapalan")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "persatuan pembaiki")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "teksi")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "mariamman")!=0 & icnpo==12100

replace icnpo = 7200 if strpos(lowname, "hak pengguna")!=0 & icnpo==12100
replace icnpo = 7200 if strpos(lowname, "lindungan pengguna")!=0 & icnpo==12100


tab icnpo


* combining 2 (or more keywords)
* [perhaps re-do earlier classification to ensure accurace!]
replace icnpo = 1300 if strpos(lowname, "budaya")!=0 & strpos(lowname, "sukan")!=0 & strpos(lowname, "kebajikan")!=0

replace icnpo = 11100 if strpos(lowname, "persatuan")!=0 & strpos(lowname, "kakitangan")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "emergency")!=0 & icnpo==12100
replace icnpo = 4300 if strpos(lowname, "relief")!=0 & icnpo==12100

* rectifying 'emergency' from 1300 -> 4200
replace icnpo = 4200 if strpos(lowname, "emergency")!=0 & icnpo==1300

* rectifying 'kebajikan penganut' from 10100 -> 7100
replace icnpo = 7400 if strpos(lowname, "kebajikan penganut")!=0 & icnpo==10100

replace icnpo = 7400 if strpos(lowname, "persatuan imam")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kebajikan tamilan")!=0 & icnpo==12100


replace icnpo = 7200 if strpos(lowname, "pemulihan dadah")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "pertanian")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "kelab hash")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "kelab hasil")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "penyelamat kelemasan")!=0 & icnpo==12100
replace icnpo = 4200 if strpos(lowname, "persatuan penyelamat")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "kelab balai bomba")!=0 & icnpo==12100

replace icnpo = 4200 if strpos(lowname, "kelab pasukan penyelamat ampang")!=0 & icnpo==12100
replace icnpo = 4200 if strpos(lowname, "kelab penyelamat dan resusitasi")!=0 & icnpo==12100
replace icnpo = 4200 if strpos(lowname, "kelantan rescue and communications")!=0 & icnpo==12100


replace icnpo = 5100 if strpos(lowname, "penyelamat bumi")!=0 & icnpo==12100


replace icnpo = 7100 if strpos(lowname, "bekas perajurit")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas tentera")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas bomba")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas polis")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas pendidik")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas kastam")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "bekas pasukan")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas anak anak")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas pemandu")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas warga")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas ahli majlis")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas artileri")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "bekas duta")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas wartawan")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas askar")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas penjaga")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas pelatih")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "bekas skot")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "pertubuhan bekas")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "kelab bekas")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, "kanak kanak sakit kritikal")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "kanak kanak keperluan khas")!=0 & icnpo==12100


***********************************************************
* all below are RESIDUALS only to be applied once ALL are assigned
replace icnpo = 7100 if strpos(lowname, "bekas")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "scout")!=0 & icnpo==12100

* anak jati/negeri = rights of cetain grps
replace icnpo = 7100 if strpos(lowname, "anak jati")!=0 & icnpo==12100
replace icnpo = 7100 if strpos(lowname, "anak negeri")!=0 & icnpo==12100

* anak malaysia = social according to web
replace icnpo = 1300 if strpos(lowname, "kelab anak malaysia")!=0 & icnpo==12100


replace icnpo = 4100 if strpos(lowname, "palsi serebrum")!=0 & icnpo==12100

* refers to the profession
replace icnpo = 11100 if strpos(lowname, "pendidikan awal")!=0 & icnpo==12100


* residuals, includes both support (parents) & welfare = 4100
replace icnpo = 4100 if strpos(lowname, "anak istimewa")!=0 & icnpo==12100

* 'agape' residuals, assign ministry ti 10100 & then all others to 4100
replace icnpo = 10100 if strpos(lowname, "agape ministries")!=0 & icnpo==12100
replace icnpo = 4100 if strpos(lowname, "agape")!=0 & icnpo==12100

* tuai rumah = ethnic+specific grp (like imam/paderi), not like ketua kampung = profession(al) - salaried civil servant
replace icnpo = 7400 if strpos(lowname, "tuai ")!=0 & icnpo==12100

* bimbing agama = ritual
replace icnpo = 10100 if strpos(lowname, "bimbingan agama")!=0 & icnpo==12100

* 7200 crime prevention
replace icnpo = 7200 if strpos(lowname, "keselamatan taman")!=0 & icnpo==12100
replace icnpo = 7200 if strpos(lowname, "keselamatan dan rondaan")!=0 & icnpo==12100

* w/kerja = wargakerja, amended
replace lowname = subinstr(lowname,"w/kerja","wargakerja",.)

* residual 'wargakerja' = welfare of workers - 11100
replace icnpo = 11100 if strpos(lowname, "wargakerja")!=0 & icnpo==12100

* non residential senior citizen = 4100
replace icnpo = 4100 if strpos(lowname, "senior citizen")!=0 & icnpo==12100


* ethnic grp
replace icnpo = 7400 if strpos(lowname, "bisaya")!=0 & icnpo==12100

* persatuan penyanyi = 11100 because like persatuan artis, represents singers not the art
replace icnpo = 11100 if strpos(lowname, "persatuan penyanyi")!=0 & icnpo==12100
* residual penyanyi = 1100
replace icnpo = 1100 if strpos(lowname, "penyanyi")!=0 & icnpo==12100



* distributors
replace icnpo = 11100 if strpos(lowname, "distribut")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "dewan ind")!=0 & icnpo==12100


* waris haji/hajjah - clan = 7400
replace icnpo = 7400 if strpos(lowname, " waris ha")!=0 & icnpo==12100

* waris dato - clan = 7100
replace icnpo = 7400 if strpos(lowname, " waris da")!=0 & icnpo==12100

* pembaca - literature
replace icnpo = 1100 if strpos(lowname, "pembaca")!=0 & icnpo==12100

* karyawan = writer
replace icnpo = 1100 if strpos(lowname, "karyawan")!=0 & icnpo==12100

* warga jabatan = employee welfare
replace icnpo = 11100 if strpos(lowname, "warga jabatan")!=0 & icnpo==12100

* psikiatri - residuals including education
replace icnpo = 3300 if strpos(lowname, "psikiatri")!=0 & icnpo==12100

* kebajikan pesakit = social welfare (like kebajikan warga emas, anak yatim etc)
replace icnpo = 4100 if strpos(lowname, "kebajikan pesakit")!=0 & icnpo==12100

* keturunan = clan = 7100
replace icnpo = 7400 if strpos(lowname, "keturunan")!=0 & icnpo==12100

* huffaz = quranuc reciters = 10100
replace icnpo = 10100 if strpos(lowname, "huffaz")!=0 & icnpo==12100

* petugas (residuals) = 'worker' =11100
replace icnpo = 11100 if strpos(lowname, "petugas")!=0 & icnpo==12100

* penyair = poetry = 1100
replace icnpo = 1100 if strpos(lowname, "penyair")!=0 & icnpo==12100

* 'ayahanda' = godfather = 7100 rights of 'specific groups' like veterans etc
replace icnpo = 7100 if strpos(lowname, "ayahanda")!=0 & icnpo==12100

* residual surau = house of worship = 10100
replace icnpo = 10100 if strpos(lowname, "surau")!=0 & icnpo==12100

* kasih karunia = grace 10100
replace icnpo = 10100 if strpos(lowname, "kasih karunia")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, "kasih kurnia")!=0 & icnpo==12100
* residual 'grace' 
replace icnpo = 10100 if strpos(lowname, "grace ")!=0 & icnpo==12100

* rumah amal = charity home == nursing home = 3200
replace icnpo = 3200 if strpos(lowname, "rumah amal")!=0 & icnpo==12100

* pembeli rumah terbengkalai = victims, consumer issues = 7200
replace icnpo = 7200 if strpos(lowname, "rumah terbengkalai")!=0 & icnpo==12100

* pembeli rumah = consumer rights
replace icnpo = 7200 if strpos(lowname, "pembeli rumah")!=0 & icnpo==12100

* amitabha = buddha
replace icnpo = 10100 if strpos(lowname, "amitabha")!=0 & icnpo==12100

* kebajikan guru = employee 11100
replace icnpo = 11100 if strpos(lowname, "kebajikan guru")!=0 & icnpo==12100

* rumah kebajikan = welfare home == nursing home = 3200
replace icnpo = 3200 if strpos(lowname, "rumah kebajikan")!=0 & icnpo==12100

* pengurusan kredit = credit management awareness = 7200
replace icnpo = 7200 if strpos(lowname, "pengurusan kredit")!=0 & icnpo==12100

* ibu bapa guru = pta = 2500
replace icnpo = 2500 if strpos(lowname, "ibu bapa dan guru")!=0 & icnpo==12100

* sri guru = religious guru = 10100
replace icnpo = 10100 if strpos(lowname, "sri guru ")!=0 & icnpo==12100

* sree (residual) = hindu related term
replace icnpo = 10100 if strpos(lowname, "sree ")!=0 & icnpo==12100

* lawyer = 11100
replace icnpo = 11100 if strpos(lowname, "lawyer")!=0 & icnpo==12100

* engineer = 11100
replace icnpo = 11100 if strpos(lowname, "engineer")!=0 & icnpo==12100

* dental = 11100
replace icnpo = 11100 if strpos(lowname, " dental ")!=0 & icnpo==12100

* hiv (aids) = 4100
replace icnpo = 4100 if strpos(lowname, "hiv/aids")!=0 & icnpo==12100

* pertubuhan pendidikan = informal providers of education = 2300
replace icnpo = 2300 if strpos(lowname, "pertubuhan pendidikan")!=0 & icnpo==12100

* pembangunan pendidikan = informal providers of education = 2300
replace icnpo = 2300 if strpos(lowname, "pembangunan pendidikan")!=0 & icnpo==12100

* jawatankuasa tabung kebajikan sekolah sekolah = 2100
replace icnpo = 2100 if strpos(lowname, "jawatankuasa tabung kebajikan sekolah")!=0 & icnpo==12100

* tabung kebajikan = 4 300
replace icnpo = 4300 if strpos(lowname, "tabung kebajikan")!=0 & icnpo==12100

* sukarela - residual = 8 100
replace icnpo = 8100 if strpos(lowname, "sukarela")!=0 & icnpo==12100

* seah - chinese surname
replace icnpo = 7400 if strpos(lowname, " seah")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "oversea chinese")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persatuan shing ann")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persatuan sim ")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "thai poo")!=0 & icnpo==12100

replace icnpo = 2100 if strpos(lowname, "chinese school")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "persatuan simfoni")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "devasthanam")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "kelab lambretta")!=0 & icnpo==12100

replace icnpo = 7200 if strpos(lowname, " rehab ")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, "orang istimewa")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "protestan")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "badan keluarga")!=0 & icnpo==12100


**
replace icnpo = 3400 if strpos(lowname, "muscular dystrophy")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, " jentera ")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "vespa")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "skuter")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "drivers association")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "motorsports association of malaysia")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "pertubuhan permotoran")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "lorry association")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "bengkel")!=0 & icnpo==12100

replace icnpo = 1200 if strpos(lowname, "motorsport")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, "kelab graduan")!=0 & icnpo==12100

replace icnpo = 2300 if strpos(lowname, "institut keusahawanan negara")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, " usahawan ")!=0 & icnpo==12100

replace icnpo = 6100 if strpos(lowname, "ra usj12/2")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "peh kong")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "ikatan penulis")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "ikatan muslimin")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "seni lukis")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "kelab") & strpos(lowname, " guru ") & icnpo==12100

replace icnpo = 2300 if strpos(lowname, "persatuan pendidikan penerokaan dan pembangunan sains angkasa")!=0

replace icnpo = 1200 if strpos(lowname, "scuba")!=0 & icnpo==12100

replace icnpo = 7100 if strpos(lowname, "peneroka") & icnpo==12100

replace icnpo = 1300 if strpos(lowname, " motorsikal ")!=0 & icnpo==12100

**
replace icnpo = 7400 if strpos(lowname, " tamils ") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kemajuan orang tamil ") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "an kemajuan tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "kebajikan dan kemasyarakatan tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "pertubuhan tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "masyarakat tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persatuan mesra tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persaudaran tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "memartabatkan tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "perpaduan warga tamil") & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "tamil forum") & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "pemilik perniagaan")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "kelab perdagangan")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "e dagang")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "dan perdagangan")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "chemical industries council")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "federation of sabah industries")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "malaysian industry government group for high technology")!=0 & icnpo==12100
replace icnpo = 2300 if strpos(lowname, "securities industry development")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "industri motor")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "firma akauntan")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "jurutera perunding")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(lowname, "pegawai")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "mualaf")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "muallaf")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "persaudaraan islam")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "persaudaraan muslim")!=0 & icnpo==12100
replace icnpo = 7400 if strpos(lowname, "komuniti cina muslim")!=0 & icnpo==12100

replace icnpo = 8100 if strpos(lowname, "education fund")!=0 & icnpo==12100
replace icnpo = 2500 if strpos(lowname, " starian ")!=0 & icnpo==12100

replace icnpo = 4100 if strpos(lowname, " oku ")!=0 & icnpo==12100

replace icnpo = 3400 if strpos(lowname, "penderma darah")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "boat club")!=0 & icnpo==12100

replace icnpo = 2500 if strpos(lowname, " lepasan ")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "perbadanan kota buku")!=0 & icnpo==12100

replace icnpo = 1300 if strpos(lowname, "perbadanan kemajuan")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "penyokong perayaan")!=0 & icnpo==12100

save "\\dochart\users\nbp1\Desktop\AllOrgs+TU_ICNPOsorted_20190530.dta", replace
* at 30/5/2019

********************************************************************************

* 11/6/2019

list lowname roscat if strpos(lowname, " ajaran")!=0 & icnpo==12100
replace icnpo = 10100 if strpos(lowname, " ajaran")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "kung mern")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "dewi ")!=0 & icnpo==12100

replace icnpo = 10100 if strpos(lowname, "madrasa")!=0 & icnpo==12100

replace icnpo = 11100 if strpos(lowname, "retail dealers")!=0 & icnpo==12100

replace icnpo = 1100 if strpos(lowname, "badan warisan")!=0 & icnpo==12100

replace icnpo = 10200 if strpos(lowname, "persatuan takziah")!=0 & icnpo==12100

replace icnpo = 10200 if strpos(lowname, "pertubuhan takziah")!=0 & icnpo==12100

replace icnpo = 10200 if strpos(lowname, "chinese cemetry")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "chinese welfare")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "chinese mutual")!=0 & icnpo==12100

replace icnpo = 7400 if strpos(lowname, "kesatuan melayu")!=0 

* residual charitable w/o relig name or not grant making foundation
replace icnpo = 4300 if strpos(lowname, "charitable")!=0 & icnpo==12100

* classify according to roscat

* roscat security => 7200
list lowname if strpos(roscat, "security")!=0 & icnpo==12100
replace icnpo = 7200 if strpos(roscat, "security")!=0 & icnpo==12100

* roscat religious => 10100
replace icnpo = 10100 if strpos(roscat, "religious")!=0 & icnpo==12100

* roscat commerce / professional => 11100
replace icnpo = 11100 if strpos(roscat, "commerce")!=0 & icnpo==12100
replace icnpo = 11100 if strpos(roscat, "professional")!=0 & icnpo==12100

* roscat rights => 7100
replace icnpo = 7100 if strpos(roscat, "rights")!=0 & icnpo==12100

* roscat social / recreation => 1300
replace icnpo = 1300 if strpos(roscat, "social")!=0 & icnpo==12100
replace icnpo = 1300 if strpos(roscat, "recreation")!=0 & icnpo==12100

* roscat art and culture => 1100
replace icnpo = 1100 if strpos(roscat, "culture")!=0 & icnpo==12100

* roscat welfare => 4100, would fit into any sub cat in G4 but 4100 widest coverage
replace icnpo = 4100 if strpos(roscat, "welfare")!=0 & icnpo==12100

* roscat mutual => 7100, most org focus on welfare of specific group, although some could be ethnic/relig
replace icnpo = 7100 if strpos(roscat, "mutual")!=0 & icnpo==12100

tab icnpo

save "C:\Users\nbp1\Desktop\AllOrgs+TU_ICNPOsorted_20190611.dta", replace
* 11/6/2019



*****************************************************************************
* create newvar for general ICNPO group, to describe org distribution by icnpo group  
* has to be done last as it oly assigns icnpo grps at point of creation, any changes to icnpo post creation will not be captured.

capture drop icnpogrp	 
generate icnpogrp = .
label variable icnpogrp "International Classification of NonProfit Organisation Groups"

replace icnpogrp = 1 if icnpo==1100 
replace icnpogrp = 1 if icnpo==1200 
replace icnpogrp = 1 if icnpo==1300 
replace icnpogrp = 2 if icnpo==2100 
replace icnpogrp = 2 if icnpo==2200 
replace icnpogrp = 2 if icnpo==2300 
replace icnpogrp = 2 if icnpo==2400 
replace icnpogrp = 2 if icnpo==2500 
replace icnpogrp = 3 if icnpo==3100 
replace icnpogrp = 3 if icnpo==3200 
replace icnpogrp = 3 if icnpo==3300 
replace icnpogrp = 3 if icnpo==3400 
replace icnpogrp = 4 if icnpo==4100 
replace icnpogrp = 4 if icnpo==4200 
replace icnpogrp = 4 if icnpo==4300 
replace icnpogrp = 5 if icnpo==5100 
replace icnpogrp = 5 if icnpo==5200 
replace icnpogrp = 6 if icnpo==6100 
replace icnpogrp = 6 if icnpo==6200 
replace icnpogrp = 6 if icnpo==6300 
replace icnpogrp = 7 if icnpo==7100 
replace icnpogrp = 7 if icnpo==7200 
replace icnpogrp = 7 if icnpo==7300
replace icnpogrp = 7 if icnpo==7400
replace icnpogrp = 8 if icnpo==8100 
replace icnpogrp = 9 if icnpo==9100 
replace icnpogrp = 10 if icnpo==10100 
replace icnpogrp = 10 if icnpo==10200 
replace icnpogrp = 11 if icnpo==11100 
replace icnpogrp = 12 if icnpo==12100 

tab icnpogrp
 
* ICNPOgrp	|
*			|      Freq.     Percent        Cum.
* ------------+-----------------------------------
*         1 |     24,351       30.53       30.53
*		  2 |      2,944        3.69       34.23
*         4 |      7,738        9.70       44.42
*         5 |        257        0.32       44.74
*		  6 |      5,297        6.64       51.38
*         7 |     14,232       17.85       69.23
*         8 |      1,889        2.37       71.60
*         9 |         19        0.02       71.62
*        10 |     13,924       17.46       89.08
*        11 |      8,025       10.06       99.14
*        12 |        684        0.86      100.00
* ------------+-----------------------------------
*     Total |     79,750      100.00

tab icnpo

** 11/6/2019 @ 20:33

******************************************************************************


**//-------------------------------------------------------------------**\\

*** challenges ***
* when 2 categories are present in orgname, eg kebudayaan dan sukan - sports or culture (1200v1100)? or kebudayaan dan sosial (1100v1300) or sosial dan kebajikan (1300v7100)


**//-------------------------------------------------------------------**\\


**NOTES*****************************************************

* the foll are examples to prevent overwriting
replace icnpo = 1100 if dupcodes==1 & icnpo1100>=1
replace icnpo = 1200 if dupcodes==1 & icnpo1200>=1 & icnpo != 1100
replace icnpo = 1300 if dupcodes==1 & icnpo1300>=1 & (icnpo != 1100 | icnpo != 1200)


* RA are not included under 6200 because ICNPO's definition includes development, construction, management, leasing, related assistance to provision of housing. RAs are community organsiation 'working towards improving the quality of life within communities or neighbourhoods' hence classified under 6100


*** notes on classification
** unit of measurement is OBJECTIVE and BENEFICIARY of organisation [ACTIVITY?]
* first rule is to look at the objective (activity) then look at beneficiary/target group
* e.g. a church - activity is religion, beneficiary by default Christians = 10100
* e.g. sports club for all employees - objective (activity) is sports, beneficiaries - everyone (or everyne associated with the organisation) = 1200
* e.g. sports club for malay employees - objective is sports activities, beneficiaries - only malay employess (or malays in general) = 7400
* e.g. employee social club of the state religious department - objective is social, beneficiaries - employees (silent on ethnicity or religion therefore assumed all employees) of department = 1300


* "kelab sukan jabatan hal ehwal orang asli" is 1600 because the kelab is for staff of org asli dept (even if they are not OA, unlike other eg above are for specific group)
* similarly, 

*"kelab sukan dan kebajikan jabatan hal ehwal agama islam" is also 1300 because the object is sukan & kebajikan and not religion



* issue arises when an organsation serves both ethnic and religion, which prevails? for this research, the decision is to assign such organisations to religious category.  refer - stewart 2009







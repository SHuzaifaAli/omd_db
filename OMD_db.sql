-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 07:08 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OMD_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(11) NOT NULL,
  `id_user` text NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id_category` int(11) NOT NULL,
  `category` varchar(150) NOT NULL,
  `image` text NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id_category`, `category`, `image`, `status`) VALUES
(1, 'Antibiotics', 'assets/images/1.jpeg', 'on'),
(2, 'Vitamins', 'assets/images/2.jpeg', 'on'),
(3, 'Digestive', 'assets/images/3.jpeg', 'on'),
(4, 'Skin', 'assets/images/4.jpeg', 'on'),
(5, 'Cough and Flu', 'assets/images/5.jpeg', 'on'),
(6, 'Fever', 'assets/images/6.jpeg', 'on'),
(7, 'Antiseptics', 'assets/images/7.jpeg', 'on'),
(8, 'Covid-19 Info', 'assets/images/8.jpeg', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `order_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id_orders` int(11) NOT NULL,
  `invoice` varchar(20) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `id_category`, `name`, `description`, `image`, `price`, `status`, `created_at`) VALUES
(1, 1, 'AMOXSAN 500 MG 10 CAPSULE','AMOXSAN is an antibiotic drug containing Amoxicillin 500 mg .Amoxicillin is a penicillin derivative with broad spectrum antibacterial activity. This drug is bactericidal which is effective against Gram negative and Gram positive bacteria such as Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H influenzas, E. coli, and P. mirabiis. The use of this medicine must be in accordance with DOCTOR INSTRUCTIONS. ', 'https://d2qjkwm11akmwu.cloudfront.net/products/a4f4d159-2e8b-4f00-8ba4-605099e3d839_product_image_url.webp', 265, 1, '2021-04-02 09:49:21'),
(2, 1, ' ZITROLINE CAPLETS 500 MG', 'ZITROLIN is a drug containing Azithromycin in the form of film-coated caplets.Azithromycin is a macrolide antibiotic that is given orally. The mechanism of action of azithromycin is by binding to the 50S ribosomal subunit, thereby interfering with bacterial protein synthesis. The drug is used for the treatment of mild to moderate infections, upper and lower respiratory tract, skin and soft tissue, sexually transmitted diseases. The use of this medicine must be in accordance with DOCTOR INSTRUCTIONS.', 'https://d2qjkwm11akmwu.cloudfront.net/products/f9bf636d-22bb-4761-9448-9d436338ee5c_product_image_url.webp', 699, 1, '2021-04-02 09:50:38'),
(3, 1, 'AMOXSAN DRY SYRUP 60 ML', 'AMOXSAN is an antibiotic drug containing Amoxicillin 125 mg every 5 ml. Amoxicillin is a Penicillin derivative with broad spectrum antibacterial activity. This drug is bactericidal which is effective against Gram negative and Gram positive bacteria such as Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H influenzas, E. coli, and P. mirabiis. The use of this medicine must be in accordance with DOCTORS INSTRUCTIONS.', 'https://d2qjkwm11akmwu.cloudfront.net/products/cef941df-136a-41c7-b44a-449ba346da57_product_image_url.webp', 473, 1, '2021-04-02 09:51:29'),
(4, 1, 'AMOXICILLIN 250 MG 10 CAPSULE', 'AMOXICILLIN is  an antibiotic that contains the active substance Amoxicillin. Amoxicillin belongs to the class of ampicillin-derived beta-lactam antibiotics. \r\nThis drug is used in upper respiratory tract infections, otitis media, acute and chronic bronchitis, pneumonia, cystitis, urethritis, pyelonephritis, asymptomatic bacteriuria during pregnancy, gonorrhea, skin and soft tissue infections. \r\nAmoxicillin has a spectrum similar to ampicillin, namely gram-positive and gram-negative. Works by binding to penicillin-binding proteins that inhibit the transpeptidation process (cross-linking process in cell wall synthesis), activating autolytic enzymes in bacterial cell walls. This process causes the lysis of the cell wall and the destruction of the bacterial cell. \r\nThe use of this medicine must be in accordance with the doctors instructions.', 'https://d2qjkwm11akmwu.cloudfront.net/products/2cdeb522-60e3-4ac7-b5f6-7a374ae52777_product_image_url.webp', 110, 1, '2021-04- 02 09:53:21'),
(5, 1, 'AMOXICILLIN SYRUP 125 MG/5 ML 60 ML', 'AMOXICILLIN SYRUP 125 MG/5 ML is a generic antibiotic drug derived from Penicillin with broad spectrum antibacterial activity. \r\nThis drug is bactericidal which is effective against Gram negative and Gram positive bacteria such as Staphylococci, Streptococci, Enterococci, S. pneumoniae, N. gonorrhoeae, H influenzas, E. coli, and P. mirabiis. \r\nThe use of this medicine must be in accordance with the DOCTORS INSTRUCTION.', 'https://d2qjkwm11akmwu.cloudfront.net/products/4c1bff61-da76-49cd-a1d8-513eb75db4e4_product_image_url.webp', 98, 1, '2021-04- 02 09:54:38'),
(6, 2, 'PHARMATON FORMULA 5 CAPSULES', 'PHARMATON FORMULA is a combination of multivitamins, minerals and ginseng extract which is effective in reducing fatigue, increasing stamina during physical activity, supporting memory and learning abilities, and can help stabilize emotions.', 'https://d2qjkwm11akmwu.cloudfront.net/products/81e69e67-a485-4a77-bab7-c9e6577b00cd_product_image_url.webp', 106, 1, '2021-04-02 09:56:53'),
(7, 2, 'IMBOOST FORCE EXTRA STRENGTH 10 TABLET', 'IMBOOST FORCE EXTRA STRENGTH TABLET is a supplement containing Echinacea purpurea herb dry extract, Blackelderberry fruit dry extract, Zn Piccolinate in the form of film-coated caplets. This supplement is used to help increase and maintain the immune system so as to prevent illness and accelerate healing. \r\nImboost extra strength works quickly to activate the immune system directly in our bodys defense system by increasing antibodies so that the bodys immune system is stronger against virus attacks.', 'https://d2qjkwm11akmwu.cloudfront.net/products/bb39638d-3536-4cd7-934a-519ccc96dc4e_product_image_url.webp', 158, 1, '2021-04-02 09:57:57'),
(8, 2, 'HOLISTICARE ESTER C 30 TABLET', 'HOLISTICARE ESTER C TABLET is a supplement that contains Vitamin C in the form of an ester, so it is safer in the stomach and its absorption into the bloodstream becomes faster, and lasts in the body 2 times longer than ordinary vitamin C (in the form of Ascorbic Acid). . \r\nThe vitamin C content in this supplement has a role as an antioxidant for the body. In addition, this supplement is used to maintain the immune system, and treat symptoms of vitamin C deficiency.', 'https://d2qjkwm11akmwu.cloudfront.net/products/093cc977-5cb3-44e3-b225-f233a8969faa_product_image_url.webp', 602, 1 , '2021-04-02 09:57:57'),
(9, 2, 'ENERVON-C 30 TABLET', 'ENERVON C is a food supplement containing multivitamins such as Vitamin C, Vitamin B1, Vitamin B2, Vitamin B6, Vitamin B12, Vitamin D, Niacinamide, Calcium pantothenate in the form of coated tablets. \r\nThis vitamin supplement is useful to help maintain body resistance. The combination of vitamin C and B complex is needed for the body that lacks vitamins, so that the bodys immune system is maintained and helps to recover after illness.', 'https://d2qjkwm11akmwu.cloudfront.net/products/ceaa46b9-b668-4d9b-988f-909c0d42a141_product_image_url.webp', 475, 1, '2021-04-02 10:00:05'),
(10, 2, 'REDOXON TRIPLE ACTION EFFERVESCENT 10 TABLET', 'REDOXON TRIPLE ACTION EFFERVESCENT is equipped with Vitamin D which works together with Vitamin C and Zinc, helping to maintain body resistance during travel, weather conditions, and exposure to pollution. Vitamin C helps the immune system and health and acts as an antioxidant to ward off free radicals. \r\nVitamin D is useful for helping the performance of white blood cell groups in maintaining the bodys resistance. Zinc helps the performance of vitamin C, so it becomes more effective in maintaining the immune system, and Zinc is a substance that is not produced by the body. \r\nIf food intake is not sufficient for daily needs, supplementation can be given if necessary.', 'https://d2qjkwm11akmwu.cloudfront.net/products/5753ee0c-1f3e-47c5-a0e0-e12d5e070001_product_image_url.webp', 316, 1 , '2021-04-02 10:00:05'),
(11, 3, 'POLYSILANE SIRUP 100 ML', 'POLYSILANE SYRUP is an ulcer and anti-bloating medicine containing Dimethylpolysiloxane, Aluminum hydroxide, and Magnesium hydroxide in syrup form. \r\nThis drug is used to reduce symptoms associated with excess stomach acid, gastritis, peptic ulcers, duodenal ulcers, with symptoms such as nausea, stomach pain, heartburn, bloating and a feeling of fullness in the stomach.', 'https://d2qjkwm11akmwu.cloudfront.net/products/b9b8f712-95a3-43eb-b511-e6ee9159c18c_product_image_url.webp', 272, 1, '2021-04-02 10:04:20'),
(12, 3, 'ANTASIDA DOEN 10 TABLET', 'DOEN ANTASIDA is a chewable tablet containing Aluminum Hydroxide and Magnesium Hydroxide. This drug is used to treat stomach ulcers with symptoms of heartburn, frequent belching, and flatulence.', 'https://d2qjkwm11akmwu.cloudfront.net/products/e23de753-b921-4b65-b505-6480bbc29640_product_image_url.webp', 320, 1 , '2021-04-02 10:04:20'),
(13, 3, 'PROMAG 12 TABLET', 'PROMAG is a drug containing Hydrotalcite, Mg(OH)2, Simethicone in tablet form. This drug is used to reduce symptoms associated with: excess stomach acid, gastritis, gastric ulcers, intestinal ulcers. Symptoms such as nausea, stomach pain, heartburn, bloating and a feeling of fullness in the stomach.', 'https://d2qjkwm11akmwu.cloudfront.net/products/630231_1-4-2019_18-19-5.jpg', 100, 1, '2021-04-02 10:04:20'),
(14, 4, 'DERMATIX ULTRA GEL 15 G', 'DERMATIX ULTRA GEL 15 G is a medicine that is used to help disguise even scars.', 'https://d2qjkwm11akmwu.cloudfront.net/products/4e225a58-5096-40db-bc4b-45caead0ef98_product_image_url.webp', 8527, 1, '2021-04-02 10:09:16'),
(15, 4, 'KALPANAX K CREAM 5 G', 'KALPANAX K CREAM contains Miconazole which is an antifungal drug of the imidazole class, used to treat skin diseases caused by fungal infections.', 'https://d2qjkwm11akmwu.cloudfront.net/products/968bf501-99d8-4045-849c-cc406f356077_product_image_url.webp' , 208, 1, '2021-04-02 10:09:16'),
(16, 5, 'BISOLVON EXTRA SIRUP 60 ML', 'BISOLVON EXTRA SYRUP contains Bromhexine HCl and Guaifenesin. This drug is used to treat cough with phlegm which works as a secretolytic (mucolytic) and expectorant to relieve coughing with phlegm and facilitate the expulsion of phlegm when coughing. \r\nThis medicine will help with 3 working steps, namely: by releasing, thinning, and expelling phlegm, so that phlegm can be easily expelled.', 'https://d2qjkwm11akmwu.cloudfront.net/products/208a7044-dbea-4614-af2d-ba4ede65ba53_product_image_url.webp', 688, 1, '2021-04-02 10:11:34'),
(17, 5, 'OBH COMBI PLUS BATUK FLU MENTHOL 100 ML', 'OBH COMBI PLUS Cough Flu is a medicine used to relieve cough accompanied by flu symptoms such as fever, headache, stuffy nose, and sneezing. OBH Combi Plus Cough Flu Menthol works as an expectorant (helps to expel phlegm), antihistamine (reduces allergy symptoms, analgesic-antipyretic (reduces fever, fever, and relieves headaches), and nasal decongestant (loosens airways).', 'https://d2qjkwm11akmwu.cloudfront.net/products/5c4dad7f-9fc9-4c50-bfca-35c78033c8a6_product_image_url.webp',228, 1, '2021-04-02 10:12:21'),
(18, 5, 'PANADOL COLD & FLU 100 CAPSULES', 'PANADOL COLD & FLU is a drug containing Paracetamol, Pseudoephedrine HCl, and Dextromethorphan HBr. This medicine can be used to relieve the symptoms of nasal congestion, cough without phlegm, and fever that accompanies the flu.', 'https://d2qjkwm11akmwu.cloudfront.net/products/f263dead-9753-4520-a07f-b4aaec689d2c_product_image_url.webp', 322, 1, '2021-04-02 10:12:21'),
(19, 6, 'PARACETAMOL 500 MG 100 CAPSULES', 'PARACETAMOL TABLET is a drug that can be used to relieve pain in headaches, toothaches, and reduce fever. Paracetamol as an analgesic, works by increasing the pain threshold and as an antipyretic which is thought to act directly on the heat regulating center in the hypothalamus.', 'https://d2qjkwm11akmwu.cloudfront.net/products/de2e8223-2622-4861-a47f-64b14e8ed8d5_product_image_url.webp', 500, 1, '2021-04-02 10:14:23'),
(20, 6, 'KOOLFEVER FOR ADULT 1 SACHET', 'KOOLFEVER ADULT is a compress plaster that reduces fever and relieves pain, and can provide a cooling effect in hot weather for adults. This plaster can provide a cooling sensation for up to 8 hours.', 'https://d2qjkwm11akmwu.cloudfront.net/products/8f3609e7-20ca-468f-a7ac-8d3360ece9d0_product_image_url.webp', 150, 1, '2021-04-02 10: 14:23'),
(21, 6, 'IBUPROFEN 400 MG 250 TABLET', 'IBUPROFEN is a generic drug which at levels of 400 mg or more is used for pain and inflammation as the main symptoms. This drug is used as an analgesic, namely to relieve mild to moderate pain, including pain in headaches, menstrual pain, pain in dental disease or tooth extraction, and pain after surgery. \r\nIn addition, this drug is used as an analgesic and anti-inflammatory by relieving the symptoms of bone, joint and non-joint rheumatic diseases, relieving symptoms due to muscle and bone/joint trauma. Ibuprofen is a class of non-steroidal anti-inflammatory drugs that have anti-inflammatory, analgesic and antipyretic effects. This drug works by inhibiting prostaglandins. \r\nThe use of this medicine must be in accordance with the doctors instructions.', 'https://d2qjkwm11akmwu.cloudfront.net/products/7689ed7d-1187-46a8-b919-978989e010ea_product_image_url.webp', 155, 1, '2021-04- 02 10:15:54'),
(22, 7, 'BETADINE SKIN CLEANSER ANTISEPTIC 100 ML', 'BETADINE SKIN CLEANSER ANTISEPTIC 100 ML antiseptic liquid soap containing Povidone iodine 10% to treat skin problems such as acne and itching, disinfect hands before surgery, and maintain healthy skin.', 'https://d2qjkwm11akmwu.cloudfront.net/products/bc8da276-31b7-4148-9254-5229e3d25dea_product_image_url.webp', 371, 1, '2021-04-02 10:17:36'),
(23, 7, 'DETTOL ANTISEPTIK CAIR 250 ML', 'DETTOL LIQUID ANTISEPTIC is a liquid antiseptic that is used as protection from diseases caused by germs. This liquid can also be used to accelerate the healing of wounds, abrasions, bites, insect stings, kill germs on dirty clothes and as a disinfectant in household appliances.', 'https://d2qjkwm11akmwu.cloudfront.net/products/02ac32c9-de61-4d68-91cf-92b4ed77525d_product_image_url.webp', 288, 1, '2021-04-02 10:17:36'),
(24, 7, 'ANTIS JERUK NIPIS SPRAY 55 ML', 'ANTIS JERUK NIPIS SPRAY 55 ML is a hand sanitizer in the form of a spray with a lime scent that contains a moisturizer that can moisturize the skin and kill germs.', 'https://d2qjkwm11akmwu.cloudfront.net/products/d138f207-6671-4d53-b372-497cc51a265d_product_image_url.webp', 645, 1, '2021-04-02 10:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `password` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `phone`, `address`, `password`, `created_at`, `status`) VALUES
(1, 'Syed Ali', 'syed@syed.com', '085819980891', 'JL G Raya No 34', '25d55ad283aa400af464c76d713c07ad', '2021-04-04 00:30:27', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category_product` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

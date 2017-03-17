-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 17, 2017 at 10:53 
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `attori`
--

CREATE TABLE `attori` (
  `IdAtt` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Cognome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attori`
--

INSERT INTO `attori` (`IdAtt`, `Nome`, `Cognome`) VALUES
(1, 'Vivien', 'Leigh'),
(2, 'Clark', 'Gable'),
(3, 'Mickey', 'Rooney'),
(4, 'Liz', 'Taylor'),
(5, 'Donald', 'Crisp'),
(6, 'Gary', 'Cooper'),
(7, 'Ingrid', 'Bergman'),
(8, 'Humphrey', 'Bogart'),
(9, 'Charlie', 'Chaplin'),
(10, 'Paulette', 'Goddard');

-- --------------------------------------------------------

--
-- Table structure for table `cast`
--

CREATE TABLE `cast` (
  `IdFilm` int(11) NOT NULL,
  `IdAtt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cast`
--

INSERT INTO `cast` (`IdFilm`, `IdAtt`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 7),
(4, 8),
(5, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `IdFilm` int(11) NOT NULL,
  `Titolo` varchar(40) NOT NULL,
  `AnnoPub` year(4) NOT NULL,
  `Genere` enum('Commedia','Drammatico','Romantico','Azione','Cartoon') NOT NULL,
  `Trama` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`IdFilm`, `Titolo`, `AnnoPub`, `Genere`, `Trama`) VALUES
(1, 'Via col vento', 1939, 'Drammatico', 'Sud degli Stati Uniti, 1861: due ricche famiglie di possidenti terrieri, gli O\'Hara, proprietari della piantagione \"Tara\", e i Wilkes della vicina tenuta \"Le Dodici Querce\", vivono spensieratamente secondo le regole del mondo del Sud, fatto di eventi mondani, ritualità e convenevoli. Un giorno la figlia maggiore degli O\'Hara, Rossella, a colazione con i fratelli Stuart e Brent Tarleton,viene a sapere che Ashley Wilkes ha intenzione di sposare la propria cugina Melania Hamilton. Rossella prende molto male la notizia, visto che anche lei è innamorata perdutamente di Ashley ed è convinta di essere ricambiata. Poco dopo Rossella va incontro al padre, Gerald, che le comunica che i Wilkes hanno intenzione di dare l\'annuncio del fidanzamento di Ashley e Melania durante la prossima merenda in programma per l\'indomani; Rossella rimane sconvolta e decide di rivelare ad Ashley l\'amore che prova per lui, convinta di poter riuscire a convincerlo a cancellare quelle nozze.....'),
(2, 'Gran Premio', 1944, 'Commedia', 'Inghilterra, anni \'20. Ultimo giorno di scuola per le sorelle Brown: Edwina, la maggiore, sogna l\'amore, mentre Velvet, la più piccola, nutre una grande passione per i cavalli. Sulla strada di casa Velvet incontra Mi, un giovane vagabondo che da suo padre ha ereditato solo un taccuino nel quale sono annotati il nome e l\'indirizzo di Mrs Brown, madre di Velvet. La donna è un\'ex-campionessa di nuoto ed è stata, a suo tempo, allenata dal padre di Mi. Dopo l\'iniziale riluttanza di Mr Brown, la famiglia decide di dargli ospitalità. Nel frattempo in città scoppia il subbuglio a causa di un cavallo imbizzarito che sta distruggendo tutto. Il proprietario, per disfarsene, lo mette come premio di una lotteria ed è proprio Velvet ad aggiudicarselo. La ragazzina, che chiama il cavallo \"Pie\", è l\'unica persona che riesce a domare l\'animale; dopo averlo allenato con l\'aiuto di Mi, anche lui esperto di cavalli, i due trovano un fantino e decidono di iscrivere Pie al Gran Premio di Londra. Velvet saluta così la sua famiglia e si reca a Londra con Mi; la sera prima della corsa la ragazzina scopre che anche Mi in passato era stato un abile fantino, ritiratosi in seguito ad un incidente. Il giorno del Gran Premio Velvet, non trovando un fantino, si traveste da uomo e partecipa alla corsa classificandosi al primo posto. Scoperta la sua identità, la giovane viene squalificata, ma ormai lei e Pie hanno acquistato notorietà e fama internazionale; Velvet è pronta a tornare a casa per riabbracciare la sua famiglia.\r\n'),
(3, 'Per chi suona la campana', 1943, 'Drammatico', 'L\'azione è ambientata durante la guerra civile spagnola e narra le vicende di un intellettuale statunitense unitosi ad un gruppo di partigiani spagnoli.'),
(4, 'Casablanca', 1942, 'Drammatico', 'Durante la seconda guerra mondiale, l\'espatriato statunitense Rick Blaine gestisce un locale, il Rick\'s Café Américain, a Casablanca, nel Marocco francese, parte della cosiddetta \"Francia non occupata\", controllata dal regime filo-nazista del Governo di Vichy. Blaine ha un passato di contrabbandiere d\'armi, in favore degli etiopi durante l\'invasione italiana del 1935, e di combattente repubblicano, durante la guerra civile spagnola nel 1936, ma sembra essere diventato un uomo cinico e dichiaratamente neutrale sulle vicende politiche e belliche che stanno accadendo.\r\n\r\nUna sera arriva nel suo locale un certo Ugarte, un malvivente molto conosciuto nella zona, con due lettere di transito rubate, reato aggravato dalla morte di due soldati tedeschi che le trasportavano; le lettere di transito sono documenti che consentono di lasciare Casablanca sull\'aereo che conduce a Lisbona permettendo, una volta arrivati, di potersi recare negli Stati Uniti....'),
(5, 'Tempi moderni', 1936, 'Commedia', 'Charlot è un operaio in una fabbrica; la sua mansione è quella di stringere i bulloni in una catena di montaggio. I gesti ripetitivi, i ritmi disumani e spersonalizzanti della catena di montaggio minano la ragione del povero Charlot; La pausa pranzo potrebbe concedere un momento di riposo per tutti i lavoratori della fabbrica, sennonché Charlot viene prescelto per sperimentare la macchina automatica da alimentazione, che dovrebbe consentire di mangiare senza interrompere il lavoro (aspetto che in una visione scientifica del lavoro produrrebbe vantaggio competitivo). L\'esperimento però gli causa parecchi danni dato che il marchingegno non funziona come si aspettavano. Le infinite ore di lavoro lo portano a....');

-- --------------------------------------------------------

--
-- Table structure for table `regia`
--

CREATE TABLE `regia` (
  `IdFilm` int(11) NOT NULL,
  `IdReg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regia`
--

INSERT INTO `regia` (`IdFilm`, `IdReg`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 3),
(4, 5),
(5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `registi`
--

CREATE TABLE `registi` (
  `IdReg` int(11) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Cognome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registi`
--

INSERT INTO `registi` (`IdReg`, `Nome`, `Cognome`) VALUES
(1, 'Victor', 'Fleming'),
(2, 'George', 'Cookor'),
(3, 'Sam', 'Wood'),
(4, 'Clarence', 'Brown'),
(5, 'Michael', 'Curtiz'),
(6, 'Charlie', 'Chaplin');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attori`
--
ALTER TABLE `attori`
  ADD PRIMARY KEY (`IdAtt`);

--
-- Indexes for table `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`IdFilm`,`IdAtt`),
  ADD KEY `IdAtt` (`IdAtt`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`IdFilm`);

--
-- Indexes for table `regia`
--
ALTER TABLE `regia`
  ADD PRIMARY KEY (`IdFilm`,`IdReg`),
  ADD KEY `IdReg` (`IdReg`);

--
-- Indexes for table `registi`
--
ALTER TABLE `registi`
  ADD PRIMARY KEY (`IdReg`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attori`
--
ALTER TABLE `attori`
  MODIFY `IdAtt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `IdFilm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `registi`
--
ALTER TABLE `registi`
  MODIFY `IdReg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cast`
--
ALTER TABLE `cast`
  ADD CONSTRAINT `cast_ibfk_1` FOREIGN KEY (`IdFilm`) REFERENCES `film` (`IdFilm`),
  ADD CONSTRAINT `cast_ibfk_2` FOREIGN KEY (`IdAtt`) REFERENCES `attori` (`IdAtt`);

--
-- Constraints for table `regia`
--
ALTER TABLE `regia`
  ADD CONSTRAINT `regia_ibfk_1` FOREIGN KEY (`IdFilm`) REFERENCES `film` (`IdFilm`),
  ADD CONSTRAINT `regia_ibfk_2` FOREIGN KEY (`IdReg`) REFERENCES `registi` (`IdReg`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

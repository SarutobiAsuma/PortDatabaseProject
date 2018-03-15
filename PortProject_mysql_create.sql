CREATE TABLE `ΑΦΙΞΗ` (
	`μοναδικός_αριθμός` char(6) NOT NULL,
	`ημ/νία_ώρα` TIMESTAMP NOT NULL,
	`καθυστέρηση_ναι/όχι` boolean NOT NULL,
	`χρόνος_καθυστέρησης` smallint,
	`διεκπεραιώθηκε_ναι/όχι` boolean NOT NULL,
	`id_πλοίου` char(5) NOT NULL,
	`προβλήτα` char(3) NOT NULL,
	`προηγούμενο_λιμάνι` varchar(25) NOT NULL,
	PRIMARY KEY (`μοναδικός_αριθμός`)
);

CREATE TABLE `ΧΩΡΟΣ ΕΛΛΙΜΕΝΙΣΜΟΥ` (
	`προβλήτα` char(3) NOT NULL,
	`πλάτος` DECIMAL(5,2) NOT NULL,
	`μήκος` DECIMAL(5,2) NOT NULL,
	`διαθεσιμότητα` tinyint NOT NULL,
	`σκοπός` varchar(60) NOT NULL,
	PRIMARY KEY (`προβλήτα`)
);

CREATE TABLE `ΑΝΑΧΩΡΗΣΗ` (
	`μοναδικός_αριθμός` char(6) NOT NULL,
	`ημ/νία_ώρα` TIMESTAMP NOT NULL,
	`καθυστέρηση_ναι/όχι` boolean NOT NULL,
	`χρόνος_καθυστέρησης` smallint,
	`διεκπεραιώθηκε_ναι/όχι` boolean NOT NULL,
	`id_πλοίου` char(5) NOT NULL,
	`προβλήτα` char(3) NOT NULL,
	`λιμάνι_προορισμού` varchar(25) NOT NULL,
	PRIMARY KEY (`μοναδικός_αριθμός`)
);

CREATE TABLE `ΚΑΠΕΤΑΝΙΟΣ` (
	`id` char(4) NOT NULL,
	`ονοματεπώνυμο` varchar(30) NOT NULL,
	`id_πλοίου` char(5) NOT NULL,
	`ΑΦΜ_Εταιρείας` char(9) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ΕΤΑΙΡΕΙΑ` (
	`ΑΦΜ` char(9) NOT NULL,
	`όνομα` varchar(20) NOT NULL,
	PRIMARY KEY (`ΑΦΜ`)
);

CREATE TABLE `ΕΠΙΒΑΤΗΣ` (
	`αριθμός_εισιτηρίου` char(6) NOT NULL,
	`ΑΦΜ_Εταιρείας` char(9) NOT NULL,
	`ονοματεπώνυμο` varchar(30) NOT NULL,
	`τρόπος_πληρωμής` varchar(20) NOT NULL,
	`αριθμός_αναχώρησης` char(6) NOT NULL,
	PRIMARY KEY (`αριθμός_εισιτηρίου`,`ΑΦΜ_Εταιρείας`)
);

CREATE TABLE `ΠΛΟΙΟ` (
	`αναγνωριστικό_id` char(5) NOT NULL,
	`όνομα` varchar(20) NOT NULL,
	`μήκος` DECIMAL(5,2) NOT NULL ,
	`πλάτος` DECIMAL(5,2) NOT NULL ,
	`πλήρωμα` smallint NOT NULL ,
	`προβλήτα` char(3),
	PRIMARY KEY (`αναγνωριστικό_id`)
);

CREATE TABLE `ΦΟΡΤΗΓΑ` (
	`id_φορτηγού` char(5) NOT NULL,
	`αποθηκευτική_ικανότητα` tinyint NOT NULL,
	PRIMARY KEY (`id_φορτηγού`)
);

CREATE TABLE `ΕΠΙΒΑΤΗΓΑ` (
	`id_επιβατηγού` char(5) NOT NULL,
	`χωρητικότητα_σε_επιβάτες` smallint NOT NULL,
	PRIMARY KEY (`id_επιβατηγού`)
);

CREATE TABLE `ΕΙΔΙΚΟΥ ΠΡΟΟΡΙΣΜΟΥ` (
	`id_ειδικού` char(5) NOT NULL,
	PRIMARY KEY (`id_ειδικού`)
);

CREATE TABLE `ΒΟΗΘΗΤΙΚΗΣ ΝΑΥΤΙΛΙΑΣ` (
	`id_βοηθητικής` char(5) NOT NULL,
	PRIMARY KEY (`id_βοηθητικής`)
);

CREATE TABLE `ΡΥΜΟΥΛΚΟ` (
	`id_ρυμουλκού` char(5) NOT NULL,
	`id_ρυμουλκούμενου` char(5) NOT NULL,
	PRIMARY KEY (`id_ρυμουλκού`)
);

CREATE TABLE `ΠΛΟΗΓΟΣ` (
	`id_πλοηγού` char(5) NOT NULL,
	`id_πληγούμενου` char(5) NOT NULL,
	PRIMARY KEY (`id_πλοηγού`)
);

CREATE TABLE `ΑΝΗΚΕΙ` (
	`ΑΦΜ_Εταιρείας` char(9) NOT NULL,
	`id_πλοίου` char(5) NOT NULL,
	PRIMARY KEY (`ΑΦΜ_Εταιρείας`,`id_πλοίου`)
);

CREATE TABLE `ΤΗΛΕΦΩΝΑ ΚΑΠΕΤΑΝΙΟΥ` (
	`τηλ_καπετάνιου` char(10) NOT NULL,
	`id_καπετάνιου` char(4) NOT NULL,
	PRIMARY KEY (`τηλ_καπετάνιου`,`id_καπετάνιου`)
);

CREATE TABLE `ΤΗΛΕΦΩΝΑ ΕΤΑΙΡΕΙΑΣ` (
	`τηλ_εταιρείας` char(10) NOT NULL,
	`ΑΦΜ_εταιρείας` char(9) NOT NULL,
	PRIMARY KEY (`τηλ_εταιρείας`,`ΑΦΜ_εταιρείας`)
);

CREATE TABLE `ΓΡΑΦΕΙΑ ΕΤΑΙΡΕΙΑΣ` (
	`διεύθυνση_γραφείου` varchar(60) NOT NULL,
	`ΑΦΜ_εταιρείας` char(9) NOT NULL,
	PRIMARY KEY (`διεύθυνση_γραφείου`,`ΑΦΜ_εταιρείας`)
);

CREATE TABLE `ΤΗΛΕΦΩΝΑ ΕΠΙΒΑΤΗ` (
	`τηλ_επιβάτη` char(10) NOT NULL,
	`εισιτήριο_επιβάτη` char(6) NOT NULL,
	PRIMARY KEY (`τηλ_επιβάτη`,`εισιτήριο_επιβάτη`)
);

ALTER TABLE `αφιξη` ADD CONSTRAINT `ΑΦΙΞΗ_fk0` FOREIGN KEY (`id_πλοίου`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `αφιξη` ADD CONSTRAINT `ΑΦΙΞΗ_fk1` FOREIGN KEY (`προβλήτα`) REFERENCES `χωρος ελλιμενισμου`(`προβλήτα`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `αναχωρηση` ADD CONSTRAINT `ΑΝΑΧΩΡΗΣΗ_fk0` FOREIGN KEY (`id_πλοίου`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `αναχωρηση` ADD CONSTRAINT `ΑΝΑΧΩΡΗΣΗ_fk1` FOREIGN KEY (`προβλήτα`) REFERENCES `χωρος ελλιμενισμου`(`προβλήτα`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `καπετανιος` ADD CONSTRAINT `ΚΑΠΕΤΑΝΙΟΣ_fk0` FOREIGN KEY (`id_πλοίου`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `καπετανιος` ADD CONSTRAINT `ΚΑΠΕΤΑΝΙΟΣ_fk1` FOREIGN KEY (`ΑΦΜ_Εταιρείας`) REFERENCES `εταιρεια`(`ΑΦΜ`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `επιβατης` ADD CONSTRAINT `ΕΠΙΒΑΤΗΣ_fk0` FOREIGN KEY (`ΑΦΜ_Εταιρείας`) REFERENCES `εταιρεια`(`ΑΦΜ`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `επιβατης` ADD CONSTRAINT `ΕΠΙΒΑΤΗΣ_fk1` FOREIGN KEY (`αριθμός_αναχώρησης`) REFERENCES `αναχωρηση`(`μοναδικός_αριθμός`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `πλοιο` ADD CONSTRAINT `ΠΛΟΙΟ_fk0` FOREIGN KEY (`προβλήτα`) REFERENCES `χωρος ελλιμενισμου`(`προβλήτα`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `φορτηγo` ADD CONSTRAINT `ΦΟΡΤΗΓΑ_fk0` FOREIGN KEY (`id_φορτηγού`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `επιβατηγo` ADD CONSTRAINT `ΕΠΙΒΑΤΗΓΑ_fk0` FOREIGN KEY (`id_επιβατηγού`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `ειδικου προορισμου` ADD CONSTRAINT `ΕΙΔΙΚΟΥ ΠΡΟΟΡΙΣΜΟΥ_fk0` FOREIGN KEY (`id_ειδικού`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `βοηθητικης ναυτιλιας` ADD CONSTRAINT `ΒΟΗΘΗΤΙΚΗΣ ΝΑΥΤΙΛΙΑΣ_fk0` FOREIGN KEY (`id_βοηθητικής`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `ρυμουλκο` ADD CONSTRAINT `ΡΥΜΟΥΛΚΟ_fk0` FOREIGN KEY (`id_ρυμουλκού`) REFERENCES `βοηθητικης ναυτιλιας`(`id_βοηθητικής`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `ρυμουλκο` ADD CONSTRAINT `ΡΥΜΟΥΛΚΟ_fk1` FOREIGN KEY (`id_ρυμουλκούμενου`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `πλοηγος` ADD CONSTRAINT `ΠΛΟΗΓΟΣ_fk0` FOREIGN KEY (`id_πλοηγού`) REFERENCES `βοηθητικης ναυτιλιας`(`id_βοηθητικής`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `πλοηγος` ADD CONSTRAINT `ΠΛΟΗΓΟΣ_fk1` FOREIGN KEY (`id_πληγούμενου`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `ανηκει` ADD CONSTRAINT `ΑΝΗΚΕΙ_fk0` FOREIGN KEY (`ΑΦΜ_Εταιρείας`) REFERENCES `εταιρεια`(`ΑΦΜ`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `ανηκει` ADD CONSTRAINT `ΑΝΗΚΕΙ_fk1` FOREIGN KEY (`id_πλοίου`) REFERENCES `πλοιο`(`αναγνωριστικό_id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `τηλεφωνα καπετανιου` ADD CONSTRAINT `ΤΗΛΕΦΩΝΑ ΚΑΠΕΤΑΝΙΟΥ_fk0` FOREIGN KEY (`id_καπετάνιου`) REFERENCES `καπετανιος`(`id`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `τηλεφωνα εταιρειας` ADD CONSTRAINT `ΤΗΛΕΦΩΝΑ ΕΤΑΙΡΕΙΑΣ_fk0` FOREIGN KEY (`ΑΦΜ_εταιρείας`) REFERENCES `εταιρεια`(`ΑΦΜ`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `γραφεια εταιρειας` ADD CONSTRAINT `ΓΡΑΦΕΙΑ ΕΤΑΙΡΕΙΑΣ_fk0` FOREIGN KEY (`ΑΦΜ_εταιρείας`) REFERENCES `εταιρεια`(`ΑΦΜ`) on DELETE CASCADE on UPDATE CASCADE;

ALTER TABLE `τηλεφωνα επιβατη` ADD CONSTRAINT `ΤΗΛΕΦΩΝΑ ΕΠΙΒΑΤΗ_fk0` FOREIGN KEY (`εισιτήριο_επιβάτη`) REFERENCES `επιβατης`(`αριθμός_εισιτηρίου`) on DELETE CASCADE on UPDATE CASCADE;

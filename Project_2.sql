CREATE DATABASE clinical;
USE clinical;

CREATE TABLE Interview (
	Problem_ID SMALLINT,
	IT_ID SMALLINT,
	Visit_ID INTEGER ,
	Type VARCHAR(1),
	Cat CHAR(1),
	CC CHAR(1),
	AwT SMALLINT,
	AnT SMALLINT,
    T_An SMALLINT,
    T_Sv SMALLINT,
    T_EL SMALLINT,
    T_ch CHAR(1),
    On_per DATE,
    On_prt DATE,
    On_GS CHAR(1),
    On_assoc CHAR(1),
    Ms CHAR(1),
    Where_ CHAR(1),
    Change_ CHAR(1),
    Fluc CHAR(1),
    Sleep_h SMALLINT,
    Tin_Concentration SMALLINT,
    Tin_Sleep SMALLINT,
    Tin_QRA SMALLINT,
    Tin_Work SMALLINT,
    Tin_Rest SMALLINT,
    Tin_Soc SMALLINT,
    Tin_other SMALLINT,
    Tin_Bad_Days CHAR(1),
    Tin_Freq SMALLINT,
    Tin_As_Freq CHAR(1),
    Tin_As_Bad CHAR(1),
    Tin_Eff_snd CHAR(1),
    Tin_how_ing CHAR(1),
    Tin_treatm NVARCHAR(256),
    Tin_Why_prob NVARCHAR(256),
    Tin_comments NVARCHAR(256),
    DST CHAR(1),
    DST_Phys CHAR(1),
    DST_Descr INTEGER,
    DST_Concert INTEGER,
    DST_shopp INTEGER,
    DST_Mov INTEGER,
    DST_Wrk INTEGER,
    DST_Rest INTEGER,
    DST_Drv INTEGER,
    DST_Sport INTEGER,
    DST_Church INTEGER,
    DST_House INTEGER,
    DST_Child INTEGER,
    DST_Soc INTEGER,
    DST_Oth INTEGER,
    DST_Oth_des VARCHAR(256),
    H_Sv NUMERIC(28),
    H_An NUMERIC(28),
    H_EL NUMERIC(28),
    DST_Bad_d CHAR(1),
    DST_Freq INTEGER,
    DST_As_Bad CHAR(1),
    DST_Eff_snd CHAR(1),
    DST_how_lng CHAR(1),
    DST_Prot CHAR(1),
    DSTT INTEGER,
    DST_when VARCHAR(256),
    DST_treat VARCHAR(256),
    DST_why_prob VARCHAR(256),
    DST_comments VARCHAR(256),
    Hp CHAR(1),
    HA CHAR(1),
    HAt VARCHAR(25),
    HAr CHAR(1),
    HA_Comments VARCHAR(256),
    Out_ CHAR(1),
    T_pr INTEGER,
    H_pr INTEGER,
    HL_pr INTEGER,
    Pr CHAR(1),
    Ret CHAR(1),
    Recom VARCHAR(256),
    Next_v NUMERIC(28),
    Next_t NUMERIC(28),
    Comments CHAR(10),
    FOREIGN KEY(Problem_ID) REFERENCES REF_Problem(Problem_ID),
    FOREIGN KEY(IT_ID) REFERENCES REF_Instr_type(IT_ID),
    FOREIGN KEY(Visit_ID) REFERENCES Audiological(Visit_ID));


CREATE TABLE REF_Problem (
	Problem_ID SMALLINT,
	Name VARCHAR(25));

CREATE TABLE REF_Instr_type (
	IT_ID SMALLINT,
	IC_ID SMALLINT,
	Name VARCHAR(256),
    PRIMARY KEY (IT_ID),
	FOREIGN KEY(IC_ID) REFERENCES REF_Instr_category(IC_ID));

CREATE TABLE REF_Instr_category (
	IC_ID SMALLINT,
    Name VARCHAR(256),
    Description VARCHAR(256),
    PRIMARY KEY(IC_ID));

CREATE TABLE Audiological (
	Visit_ID INTEGER,
    Comments VARCHAR(256),
    R25 NUMERIC(28),
    R50 NUMERIC(28),
    R1 NUMERIC(28),
    R2 NUMERIC(28),
    R3 NUMERIC(28),
    R4 NUMERIC(28),
    R6 NUMERIC(28),
    R8 NUMERIC(28),
    R10 NUMERIC(28),
    R12 NUMERIC(28),
    L25 NUMERIC(28),
    L50 NUMERIC(28),
    L1 NUMERIC(28),
    L2 NUMERIC(28),
    L3 NUMERIC(28),
    L4 NUMERIC(28),
    L6 NUMERIC(28),
    L8 NUMERIC(28),
    L10 NUMERIC(28),
    L12 NUMERIC(28),
    T_PR NUMERIC(28),
    T_Rm VARCHAR(6),
    T_LR NUMERIC(28),
    Th_R NUMERIC(28),
    T_RLs NUMERIC(28),
    T_PL NUMERIC(28),
    T_Lm VARCHAR(6),
    T_LL NUMERIC(28),
    Th_L NUMERIC(28),
    T_Ls NUMERIC(28),
    WNR NUMERIC(28),
    WNL NUMERIC(28),
    MRR NUMERIC(28),
    MRL NUMERIC(28),
    MRB NUMERIC(28),
     MLR NUMERIC(28),
     MLL NUMERIC(28),
     MLB NUMERIC(28),
     MBR NUMERIC(28),
     M_BL NUMERIC(28),
     M_BB NUMERIC(28),
     R_SD NUMERIC(28),
     L_SD NUMERIC(28),
     LR50 NUMERIC(28),
     LR1 NUMERIC(28),
     LR2 NUMERIC(28),
     LR3 NUMERIC(28),
     LR4 NUMERIC(28),
     LR6 NUMERIC(28),
     LR8 NUMERIC(28),
     LR12 NUMERIC(28),
     LRTP NUMERIC(28),
     LL50 NUMERIC(28),
     LL1 NUMERIC(28),
     LL2 NUMERIC(28),
     LL3 NUMERIC(28),
     LL4 NUMERIC(28),
     LL6 NUMERIC(28),
     LL8 NUMERIC(28),
     LL12 NUMERIC(28),
     LLTP NUMERIC(28),
     FOREIGN KEY(Visit_ID) REFERENCES Visit(Visit_ID));

CREATE TABLE Instrumentation (
Instr_ID smallint,
IC_ID smallint,
IT_ID smallint,
IM_ID smallint,
Visit_ID integer,
Comments varchar(1000)
primary key (Instr_ID),
foreign key (IC_ID) references REF_Instr_category(IC_ID),
foreign key (IT_ID) references REF_Instr_model(IT_ID),
foreign key (IM_ID) references REF_Instr_type(IM_ID),
foreign key (Visit_ID) references Visit(Visit_ID)
);
CREATE TABLE Counseling (
Visit_ID integer,
Type varchar(1),
Comments nvarchar(1000)
foreign key (Visit_ID) references Visit(Visit_ID)
);

CREATE TABLE Visit(
Visit_ID integer,
THC varchar(6),
Visit_nr smallint,
Date datetime,
Comments varchar(1000)
primary key (Visit_ID),
foreign key (THC) references Patient(THC)
);

CREATE TABLE Pharmacology (
Medicament_ID smallint,
Visit_ID smallint,
Dose numeric(28),
Duration numeric(28),
Comments varchar(1000)
foreign key (Medicament_ID) references REF_Medicament(Medicament_ID),
foreign key (Visit_ID) references Visit(Visit_ID)
);

CREATE TABLE REF_Medicament (
Medicament_ID smallint,
Generic_ID smallint,
Chem_ID smallint,
Disease_ID smallint,
Name varchar(25),
Description varchar(1000),
Usual_dose Numeric(28)
primary key (Medicament_ID) references REF_Medicament(Medicament_ID),
foreign key (Generic_ID) references REF_CatChem(Generic_ID),
foreign key (Chem_ID) references REF_Disease(Chem_ID),
foreign key (Disease_ID) references REF_Generic(Disease_ID)
);

CREATE TABLE REF_Disease (
Disease_ID smallint,
Name varchar(25),
Description varchar(1000)
primary key (Disease_ID)
);

CREATE TABLE REF_Generic (
Generic_ID smallint,
Name varchar(25),
Description varchar(1000)
primary key (Generic_ID)
);

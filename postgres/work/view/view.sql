-- FROM https://docs.postgresql.fr/18/rules-views.html

CREATE TABLE facture (
    no_facture    integer        PRIMARY KEY,
    no_vendeur    integer,       -- identifiant du vendeur
    date_facture  date,          -- date de la vente
    mtt_facture   numeric(13,2)  -- montant de la vente
);

INSERT INTO facture VALUES (2026001, 1, DATE '2026-01-01', 100.00);
INSERT INTO facture VALUES (2026002, 1, DATE '2026-01-01', 200.00);
INSERT INTO facture VALUES (2026003, 2, DATE '2026-02-02', 300.00);
INSERT INTO facture VALUES (2026004, 3, DATE '2026-02-03', 100.00);
INSERT INTO facture VALUES (2026005, 3, DATE '2026-02-03', 200.00);
INSERT INTO facture VALUES (2026006, 3, DATE '2026-02-03', 300.00);

SELECT * FROM facture;

CREATE VIEW resume_ventes AS
  SELECT
      no_vendeur,
      date_facture,
      sum(mtt_facture)::numeric(13,2) as mtt_ventes
    FROM facture
    WHERE date_facture < CURRENT_DATE
    GROUP BY
      no_vendeur,
      date_facture;


SELECT * FROM resume_ventes;

DROP VIEW resume_ventes;

CREATE MATERIALIZED VIEW resume_ventes AS
  SELECT
      no_vendeur,
      date_facture,
      sum(mtt_facture)::numeric(13,2) as mtt_ventes
    FROM facture
    WHERE date_facture < CURRENT_DATE
    GROUP BY
      no_vendeur,
      date_facture;

SELECT * FROM resume_ventes;

CREATE UNIQUE INDEX ventes_resume_vendeur
  ON resume_ventes (no_vendeur, date_facture);

SELECT * FROM resume_ventes;

INSERT INTO facture VALUES (2026007, 4, DATE '2026-03-01', 100.00);
INSERT INTO facture VALUES (2026008, 4, DATE '2026-03-01', 200.00);
INSERT INTO facture VALUES (2026009, 4, DATE '2026-03-01', 300.00);

SELECT * FROM facture;
SELECT * FROM resume_ventes;

REFRESH MATERIALIZED VIEW resume_ventes;

SELECT * FROM resume_ventes;


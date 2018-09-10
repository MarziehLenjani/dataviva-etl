CREATE TABLE COMTRADE_2013 (
    classification char(2),
    year numeric(4),
    period numeric(4),
    period_desc numeric(4),
    aggregate_level numeric(1),
    is_leaf_code numeric(1),
    trade_flow_code numeric(1),
    trade_flow char(30),
    reporter_code numeric(3),
    reporter char(50),
    reporter_iso char(3),
    partner_code_ numeric(3),
    partner char(50),
    partner_iso char(3),
    2nd_partner_code char(3),
    2nd_partner char(100),
    2nd_partner_iso char(3),
    customs_proc_code char(4),
    customs char(100),
    mode_of_transport_code char(100),
    mode_of_transport char(100),
    commodity_code char(6),
    commodity text(400),
    qty_unit_code numeric(6),
    qty_unit char(100),
    qty char(100),
    alt_qty_unit_code char(6),
    alt_qty_unit char(100),
    alt_qty char(100),
    netweight char(100),
    gross_weight char(100),
    trade_value char(100),
    cif_trade_value char(100),
    fob_trade_value char(100),
    flag numeric(1)
);

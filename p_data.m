clear; clc;
csi_trace_los = read_bf_file('data/walking4.dat');

% Walking
wk_rx1 = get_csi_vector('walking4.dat', 1);
wk_rx2 = get_csi_vector('walking4.dat', 2);
wk_rx3 = get_csi_vector('walking4.dat', 3);
wk_rx = [wk_rx1; wk_rx2; wk_rx3];
wk_mr = movvar(wk_rx, 3);
wk_id = generateUUID(1, 90);
wklabel = create_vector_label(length(wk_rx), 'Walking');

% Sitting
st_rx1 = get_csi_vector('sitting4.dat', 1);
st_rx2 = get_csi_vector('sitting4.dat', 2);
st_rx3 = get_csi_vector('sitting4.dat', 3);
st_rx = [st_rx1; st_rx2; st_rx3];
st_mr = movvar(st_rx, 3);
st_id = generateUUID(181, 180);
stlabel = create_vector_label(length(st_rx), 'Sitting');

% Standing
sd_rx1 = get_csi_vector('standing6.dat', 1);
sd_rx2 = get_csi_vector('standing6.dat', 2);
sd_rx3 = get_csi_vector('standing6.dat', 3);
sd_rx = [sd_rx1; sd_rx2; sd_rx3];
sd_mr = movvar(st_rx, 3);
sd_id = generateUUID(361, 270);
sdlabel = create_vector_label(length(sd_rx), 'Standing');

% Lying In
ly_rx1 = get_csi_vector('lyingInTraceLos2.dat', 1);
ly_rx2 = get_csi_vector('lyingInTraceLos2.dat', 2);
ly_rx3 = get_csi_vector('lyingInTraceLos2.dat', 3);
ly_rx = [ly_rx1; ly_rx2; ly_rx3];
ly_mr = movvar(ly_rx, 3);
ly_id = generateUUID(541, 360);
lylabel = create_vector_label(length(ly_rx), 'LyingIn');

ID = [wk_id st_id sd_id ly_id].';
RX = [wk_rx st_rx sd_rx ly_rx].';
MV = [wk_mr st_mr sd_mr ly_mr].';
Activity = char(wklabel, stlabel, sdlabel, lylabel);

data = table(ID, RX, MV, Activity);


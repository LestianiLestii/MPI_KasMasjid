<?php
    include "../inc/koneksi.php";
    //FUNGSI RUPIAH
    include "../inc/rupiah.php";

    $dt1 = $_POST["tgl_1"];
    $dt2 = $_POST["tgl_2"];
?>

<?php
  $sql = $koneksi->query("SELECT SUM(masuk) as tot_masuk  from kas_masjid where jenis='Masuk' and tgl_km BETWEEN '$dt1' AND '$dt2'");
  while ($data= $sql->fetch_assoc()) {
    $masuk=$data['tot_masuk'];
  }

  $sql = $koneksi->query("SELECT SUM(keluar) as tot_keluar  from kas_masjid where jenis='Keluar' and tgl_km BETWEEN '$dt1' AND '$dt2'");
  while ($data= $sql->fetch_assoc()) {
    $keluar=$data['tot_keluar'];
  }

  $saldo= $masuk-$keluar;
?>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>Laporan Kas Masjid</title>
   <link rel="icon" href="../dist/img/LogoMasjid.png">
</head>
<body>
    <table width="100%">
    <tr>
        <center>
        <td>
            <img src="../dist/img/LogoMasjid.png" width="130">
        </td>
        <td>
                <h1>
                    Laporan Kas Masjid <br>
                    <small> Masjid Jami' Al-Barokah</small><br></h1>
                    <h3>Periode : <?php $a=$dt1; echo date("d-M-Y", strtotime($a))?> s/d <?php $b=$dt2; echo date("d-M-Y", strtotime($b))?></h3>
            </td>
        </center>
        </tr>
    </table>
<hr>
  <table width="100%" border="1" cellspacing="0">
    <thead>
      <tr>
            <th>No.</th>
            <th>Tanggal</th>
            <th>Uraian Pemasukan</th>
            <th>Pemasukan</th>
            <th>Uraian Pengeluaran</th>
            <th>Pengeluaran</th>
      </tr>
    </thead>
    <tbody>
        <?php

        if(isset($_POST["btnCetak"])){
           
            $sql_tampil = "select * from kas_masjid where tgl_km BETWEEN '$dt1' AND '$dt2' order by tgl_km asc";
            }
            $query_tampil = mysqli_query($koneksi, $sql_tampil);
            $no=1;
            while ($data = mysqli_fetch_array($query_tampil,MYSQLI_BOTH)) {
        ?>
         <tr>
            <td><?php echo $no; ?></td>
            <td><?php  $tgl = $data['tgl_km']; echo date("d/M/Y", strtotime($tgl))?></td> 
            <td><?php echo $data['uraian_pm']; ?></td>
            <td><?php echo rupiah($data['masuk']); ?></td>  
            <td align="right"><?php echo $data['uraian_km']; ?></td> 
            <td align="right"><?php echo rupiah($data['keluar']); ?></td> 
  
        </tr>
        <?php
            $no++;
            }
        ?>
    </tbody>
    <tr>
        <td bgcolor="cyan" colspan="3">Total Pemasukan</td>
        <td bgcolor="cyan" colspan="3"><?php echo rupiah($masuk); ?></td>
    </tr>
    <tr>
        <td bgcolor="yellow" colspan="5">Total Pengeluaran</td>
        <td bgcolor="yellow" align="right"><?php echo rupiah($keluar); ?></td>
    </tr>
    <tr>
        <td colspan="3">Saldo Kas Masjid</td>
        <td colspan="3"><?php echo rupiah($saldo); ?></td>
    </tr>
  </table>
</center>
<p></p>
<table width="100%">
    <tr>
    <td align="left">
            <p>
                Mengetahui,
            </p>
            <p>
                Dewan Kemakmuran Masjid
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                
                <br>-------------------------------------<br>
                Ustadz. Ahmad Misbahul Munir
            </p>
        </td>
        <td align="right">
            <p>
               Tangerang Selatan, <?php echo date('d-F-Y'); ?>
            </p>
            <p>
                Bendahara Masjid
                <br>
                <br>
                <br>
                <br>
                <br>
               
                <br>-----------------------------------<br>
                 Muhammad Amier
               
            </p>
        </td>
    </tr>
</table>
<script>
    window.print();
</script>
</body>
</html>
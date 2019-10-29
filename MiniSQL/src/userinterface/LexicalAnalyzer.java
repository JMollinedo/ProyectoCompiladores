/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;

import java.io.IOException;
import java.io.StringReader;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 *
 * @author jmoll
 */
public class LexicalAnalyzer extends javax.swing.JFrame {

    /**
     * Creates new form LexicalAnalyzer
     */
    public LexicalAnalyzer() {
        initComponents();
        CurrentLex = null;
    }
    String CurrentLex;

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnCargarArchivo = new javax.swing.JButton();
        btnBorrarContenido = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        txaAnalisis = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        txaContenido = new javax.swing.JTextArea();
        btnAnalizar = new javax.swing.JButton();
        chbGenerarArchivo = new javax.swing.JCheckBox();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        btnAnalizarX = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        txaAnalisisX = new javax.swing.JTextArea();
        chbLeerOut = new javax.swing.JCheckBox();
        btnBorrarContenidoL = new javax.swing.JButton();
        btnBorrarContenidoX = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        btnCargarArchivo.setText("Cargar Archivo");
        btnCargarArchivo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCargarArchivoActionPerformed(evt);
            }
        });

        btnBorrarContenido.setText("Borrar Contenido");
        btnBorrarContenido.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBorrarContenidoActionPerformed(evt);
            }
        });

        txaAnalisis.setEditable(false);
        txaAnalisis.setColumns(20);
        txaAnalisis.setRows(5);
        jScrollPane1.setViewportView(txaAnalisis);

        txaContenido.setColumns(20);
        txaContenido.setRows(5);
        jScrollPane2.setViewportView(txaContenido);

        btnAnalizar.setText("Analizar");
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });

        chbGenerarArchivo.setText("Generar Archivo");

        jLabel1.setText("LEXICO");

        jLabel2.setText("SINTAXIS");

        btnAnalizarX.setText("Analizar");
        btnAnalizarX.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarXActionPerformed(evt);
            }
        });

        txaAnalisisX.setEditable(false);
        txaAnalisisX.setColumns(20);
        txaAnalisisX.setRows(5);
        jScrollPane3.setViewportView(txaAnalisisX);

        chbLeerOut.setText("Leer Archivo Out");

        btnBorrarContenidoL.setText("Borrar Contenido");
        btnBorrarContenidoL.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBorrarContenidoLActionPerformed(evt);
            }
        });

        btnBorrarContenidoX.setText("Borrar Contenido");
        btnBorrarContenidoX.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBorrarContenidoXActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnCargarArchivo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnBorrarContenido))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 331, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(chbGenerarArchivo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnAnalizar))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 250, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnBorrarContenidoL)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 251, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnBorrarContenidoX))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(chbLeerOut)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnAnalizarX)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(btnCargarArchivo)
                        .addComponent(btnBorrarContenido))
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel1)
                        .addComponent(jLabel2)
                        .addComponent(btnBorrarContenidoL)
                        .addComponent(btnBorrarContenidoX)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnAnalizar)
                            .addComponent(chbGenerarArchivo)
                            .addComponent(btnAnalizarX)
                            .addComponent(chbLeerOut))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 370, Short.MAX_VALUE)
                            .addComponent(jScrollPane3))))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnCargarArchivoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCargarArchivoActionPerformed
        FileNameExtensionFilter filter = new FileNameExtensionFilter("SQL file", "sql");
        JFileChooser fc = new JFileChooser();
        fc.setFileFilter(filter);
        fc.setMultiSelectionEnabled(false);
        int res = fc.showOpenDialog(fc);
        if(res == JFileChooser.APPROVE_OPTION){
            txaContenido.setText(ReadnWrite.readAllText(fc.getSelectedFile().getAbsolutePath()));
        }
    }//GEN-LAST:event_btnCargarArchivoActionPerformed

    private void btnBorrarContenidoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBorrarContenidoActionPerformed
        txaContenido.setText(null);
    }//GEN-LAST:event_btnBorrarContenidoActionPerformed

    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed
        if(!txaContenido.getText().isEmpty()){
            String content = new StringBuilder().append(txaContenido.getText()).toString();
            String temporalFilePath = "C:\\Users\\Public\\Documents\\lexTemp.txt";
            try {
                ReadnWrite.writeAllText(temporalFilePath, content);
                CurrentLex = UseJFlex.FileTest(temporalFilePath);
                ReadnWrite.deleteFile(temporalFilePath);
                if(chbGenerarArchivo.isSelected()){
                    JFileChooser fc = new JFileChooser();
                    FileNameExtensionFilter filter = new FileNameExtensionFilter("OUT file", "out");
                    fc.setDialogTitle("Guardar tokens");
                    fc.setFileFilter(filter);
                    int userSelection = fc.showSaveDialog(this);
                    if (userSelection == JFileChooser.APPROVE_OPTION) {
                        ReadnWrite.writeAllText(fc.getSelectedFile().getAbsolutePath().concat(".out"),CurrentLex);
                        ReadnWrite.writeAllText(fc.getSelectedFile().getAbsolutePath().concat(".sql"),txaContenido.getText());
                        String msg = "Archivos creados:\n"+
                                fc.getSelectedFile().getAbsolutePath().concat(".out")+"\n"+
                                fc.getSelectedFile().getAbsolutePath().concat(".sql");
                        JOptionPane.showMessageDialog(null, msg, "ERROR!", JOptionPane.INFORMATION_MESSAGE);
                    }
                }
                String s = new StringBuilder().append('\u0022').append('\u002C').append('\u0022').toString();
                String res = CurrentLex.replaceAll(s, "~" );
                s = new StringBuilder().append('\u0022').append('\n').append('\u0022').toString();
                res = res.replaceAll(s, "\n" );
                s = new StringBuilder().append('\n').append('\u0022').toString();
                res = res.replaceAll(s, "\n" );
                res = res.substring(0,res.length()- 1);
                txaAnalisis.setText(res);
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR!", JOptionPane.INFORMATION_MESSAGE);
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR!", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }//GEN-LAST:event_btnAnalizarActionPerformed

    private void btnAnalizarXActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarXActionPerformed
        String data = txaContenido.getText();
        Sintax s = new Sintax(new LexerCup(new StringReader(data)));
        try {
            s.parse();
            LinkedList<String> es = s.SyntacticErrors;
            if(es.isEmpty()){
                txaAnalisisX.setText("No Errors");
            }else{
                StringBuilder sb = new StringBuilder();
                for(String element: es){
                    sb = sb.append(element).append("\n");
                }
                txaAnalisisX.setText(sb.toString());
            }
        } catch (Exception ex) {
            Logger.getLogger(LexicalAnalyzer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnAnalizarXActionPerformed

    private void btnBorrarContenidoLActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBorrarContenidoLActionPerformed
        txaAnalisis.setText(null);
        CurrentLex = null;
    }//GEN-LAST:event_btnBorrarContenidoLActionPerformed

    private void btnBorrarContenidoXActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBorrarContenidoXActionPerformed
        txaAnalisisX.setText(null);
    }//GEN-LAST:event_btnBorrarContenidoXActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(LexicalAnalyzer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(LexicalAnalyzer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(LexicalAnalyzer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(LexicalAnalyzer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new LexicalAnalyzer().setVisible(true);
            }
        });
    }
    
    private static void ExportResults(){
        
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JButton btnAnalizarX;
    private javax.swing.JButton btnBorrarContenido;
    private javax.swing.JButton btnBorrarContenidoL;
    private javax.swing.JButton btnBorrarContenidoX;
    private javax.swing.JButton btnCargarArchivo;
    private javax.swing.JCheckBox chbGenerarArchivo;
    private javax.swing.JCheckBox chbLeerOut;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTextArea txaAnalisis;
    private javax.swing.JTextArea txaAnalisisX;
    private javax.swing.JTextArea txaContenido;
    // End of variables declaration//GEN-END:variables
}

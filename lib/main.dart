import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SupportScreen(),
    );
  }
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return Scaffold(
      appBar: AppBar(
        title: Text("Soporte - Assistify"),
        backgroundColor: Color(0xFF1B1D42),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Encabezado
              _buildHeader(),
              SizedBox(height: 30),
              // Diseño Responsivo: Información en Column para móviles y Row para escritorio
              isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
              SizedBox(height: 30),
              // Preguntas Frecuentes
              _buildFAQ(),
              SizedBox(height: 30),
              // Política de Privacidad
              _buildPrivacyPolicy(),
            ],
          ),
        ),
      ),
    );
  }

  /// **Encabezado con descripción de la app**
  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Bienvenido a Assistify",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1B1D42)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          "Assistify es una aplicación diseñada para gestionar negocios de múltiples rubros, "
          "permitiendo una organización eficiente y automatizada de tareas.",
          style: TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// **Diseño de escritorio: Información de contacto en Row**
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactInfo()),
        SizedBox(width: 40),
        Expanded(child: _buildSupportForm()),
      ],
    );
  }

  /// **Diseño de móvil: Información en Column**
  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactInfo(),
        SizedBox(height: 30),
        _buildSupportForm(),
      ],
    );
  }

  /// **Sección de Información de Contacto**
  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contacto",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B1D42)),
        ),
        SizedBox(height: 10),
        _buildContactItem(Icons.email, "Correo:", "manunv97@gmail.com"),
        _buildContactItem(Icons.phone, "Teléfono:", "+54 11 3427 2488"),
        _buildContactItem(Icons.language, "Sitio web:", "https://assistify.com"),
      ],
    );
  }

  /// **Elemento de contacto (ícono + texto)**
  Widget _buildContactItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF1B1D42), size: 24),
          SizedBox(width: 10),
          Text(
            "$label ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SelectableText(
            value,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  /// **Formulario de Contacto**
  Widget _buildSupportForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Envíanos tu consulta",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B1D42)),
        ),
        SizedBox(height: 10),
        _buildTextField("Nombre"),
        SizedBox(height: 15),
        _buildTextField("Correo electrónico"),
        SizedBox(height: 15),
        _buildTextField("Asunto"),
        SizedBox(height: 15),
        _buildTextField("Mensaje", isLarge: true),
        SizedBox(height: 20),
        _buildSubmitButton(),
      ],
    );
  }

  /// **Campos de entrada**
  Widget _buildTextField(String label, {bool isLarge = false}) {
    return TextField(
      maxLines: isLarge ? 5 : 1,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  /// **Botón de envío**
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Aquí puedes manejar el envío del formulario
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1B1D42),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          "ENVIAR",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  /// **Sección de Preguntas Frecuentes**
  Widget _buildFAQ() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Preguntas Frecuentes",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B1D42)),
        ),
        SizedBox(height: 10),
        _buildFAQItem("¿Cómo me contacto con soporte?", "Puedes enviarnos un correo a manunv97@gmail.com."),
        _buildFAQItem("¿Assistify es solo para talleres?", "No, está diseñada para múltiples rubros."),
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            answer,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  /// **Política de Privacidad**
  Widget _buildPrivacyPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Política de Privacidad",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B1D42)),
        ),
        SizedBox(height: 10),
        Text(
          "Assistify respeta tu privacidad. No compartimos datos con terceros sin tu consentimiento.",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

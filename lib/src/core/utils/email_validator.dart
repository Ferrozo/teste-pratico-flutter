String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'O email é obrigatório.';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) return 'Insira um email válido.';
  return null;
}
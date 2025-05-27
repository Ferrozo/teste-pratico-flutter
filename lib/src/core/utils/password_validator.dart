String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'A senha é obrigatória.';
  if (value.length < 6) return 'A senha deve ter pelo menos 6 caracteres.';
  return null;
}
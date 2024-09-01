import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class SupabaseModule {
  @lazySingleton
  Supabase get supabase => Supabase.instance;
  
  @lazySingleton
  SupabaseClient get supabaseClient => supabase.client;
}

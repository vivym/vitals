import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/patient.dart';
import '../providers/patient_form_provider.dart';

/// 新签约患者页面
/// 创建新患者的表单页面
class CreatePatientScreen extends ConsumerStatefulWidget {
  const CreatePatientScreen({super.key});

  @override
  ConsumerState<CreatePatientScreen> createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends ConsumerState<CreatePatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _formatGender(Gender? gender) {
    return switch (gender) {
      Gender.male => '男',
      Gender.female => '女',
      Gender.other => '其他',
      null => '请选择您的性别',
    };
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '请选择您的出生日期';
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  void _showGenderPicker() {
    showModalBottomSheet<Gender>(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '选择性别',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('男'),
                    onTap: () {
                      ref.read(patientFormNotifierProvider.notifier).updateGender(Gender.male);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('女'),
                    onTap: () {
                      ref.read(patientFormNotifierProvider.notifier).updateGender(Gender.female);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('其他'),
                    onTap: () {
                      ref.read(patientFormNotifierProvider.notifier).updateGender(Gender.other);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 30)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('zh', 'CN'),
    );

    if (date != null) {
      ref.read(patientFormNotifierProvider.notifier).updateBirthDate(date);
    }
  }

  void _handleSubmit() async {
    if (_formKey.currentState?.validate() != true) return;

    final success = await ref.read(patientFormNotifierProvider.notifier).createPatient();

    if (success && mounted) {
              // 创建成功，导航到成功页面
        context.go('/patients/create/success');
    }
  }

  Widget _buildRequiredLabel(String text) {
    return Row(
      children: [
        Text(
          '*',
          style: TextStyle(
            color: Colors.red[600],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionalLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextFormField({
    required String key,
    required String label,
    required bool isRequired,
    required Function(String) onChanged,
    String? initialValue,
    String? hintText,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    int maxLength = 50,
    String? Function(String?)? validator,
  }) {
    final formState = ref.watch(patientFormNotifierProvider);
    final errorText = formState.validationState.errors[key];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequired ? _buildRequiredLabel(label) : _buildOptionalLabel(label),
        const SizedBox(height: 8),
        TextFormField(
          key: Key('${key}_field'),
          initialValue: initialValue,
          enabled: enabled,
          keyboardType: keyboardType,
          maxLength: maxLength,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: '',
            errorText: errorText,
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red[400]!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[200]!),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildSelectField({
    required String label,
    required bool isRequired,
    required String value,
    required VoidCallback onTap,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequired ? _buildRequiredLabel(label) : _buildOptionalLabel(label),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: errorText != null ? Colors.red[400]! : Colors.grey[300]!,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: value.contains('请选择') ? Colors.grey[500] : Colors.black87,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Text(
              errorText,
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(patientFormNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          '新签约患者',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 姓名
                    _buildTextFormField(
                      key: 'name',
                      label: '真实姓名',
                      isRequired: true,
                      onChanged: (value) => ref.read(patientFormNotifierProvider.notifier).updateName(value),
                      initialValue: formState.name,
                      hintText: '王高南',
                    ),

                    const SizedBox(height: 24),

                    // 身份证号
                    _buildTextFormField(
                      key: 'id_number',
                      label: '身份证号',
                      isRequired: true,
                      onChanged: (value) => ref.read(patientFormNotifierProvider.notifier).updateIdNumber(value),
                      initialValue: formState.idNumber,
                      hintText: '请填写您的身份证号',
                      keyboardType: TextInputType.text,
                      maxLength: 18,
                    ),

                    const SizedBox(height: 24),

                    // 性别选择
                    _buildSelectField(
                      label: '性别',
                      isRequired: true,
                      value: _formatGender(formState.gender),
                      onTap: _showGenderPicker,
                      errorText: formState.validationState.errors['gender'],
                    ),

                    const SizedBox(height: 24),

                    // 出生日期
                    _buildSelectField(
                      label: '日期',
                      isRequired: true,
                      value: _formatDate(formState.birthDate),
                      onTap: _showDatePicker,
                      errorText: formState.validationState.errors['birthDate'],
                    ),

                    const SizedBox(height: 24),

                    // 联系电话（禁用，显示当前登录手机号）
                    _buildTextFormField(
                      key: 'phone',
                      label: '联系电话',
                      isRequired: true,
                      onChanged: (_) {}, // 禁用编辑
                      initialValue: '150******68',
                      enabled: false,
                    ),

                    const SizedBox(height: 24),

                    // 病案号（高亮显示）
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        border: Border.all(color: Colors.blue[200]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildTextFormField(
                        key: 'medical_record',
                        label: '病案号',
                        isRequired: false,
                        onChanged: (value) {
                          // TODO: 更新病案号
                        },
                        hintText: '请填写您在某外医院的病案号',
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 紧急联系人
                    _buildTextFormField(
                      key: 'emergency_contact',
                      label: '紧急联系人',
                      isRequired: false,
                      onChanged: (value) => ref.read(patientFormNotifierProvider.notifier).updateEmergencyContact(value),
                      initialValue: formState.emergencyContact,
                      hintText: '填写联系人姓名',
                    ),

                    const SizedBox(height: 24),

                    // 紧急联系人电话
                    _buildTextFormField(
                      key: 'emergency_phone',
                      label: '紧急联系人电话',
                      isRequired: false,
                      onChanged: (value) => ref.read(patientFormNotifierProvider.notifier).updateEmergencyContactPhone(value),
                      initialValue: formState.emergencyContactPhone,
                      hintText: '填写联系人电话',
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // 底部确定按钮
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: formState.isSubmitting ? null : _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: formState.isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          '确定',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),

      // 错误提示
      bottomSheet: formState.generalError != null
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                border: Border(
                  top: BorderSide(color: Colors.red[200]!),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red[600], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      formState.generalError!.message,
                      style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(patientFormNotifierProvider.notifier).clearGeneralError();
                    },
                    child: Text(
                      '关闭',
                      style: TextStyle(color: Colors.red[600]),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
